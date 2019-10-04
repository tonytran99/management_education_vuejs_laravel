@extends('master')

@section('title', 'Register')

@push('style')
<style type="text/css">
	body, html {
		height: 100%;
		margin: 0;
		position: relative;
	}
	#background {
		background-image: url("{{asset('uploads/background.png')}}");
		height: 100%;
		background-position: top;
		background-repeat: no-repeat;
		background-size: cover;
	}
</style>
@endpush

@section('content')
	<div id="background">
		<div class="card bg-light m-auto font-weight-bolder" style="top: 25%; width: 400px;">
			<div class="card-header text-center">
				<span class="text-uppercase">Register</span>
			</div>
			<div class="card-body">
				<form id="register_form">
				    <div class="form-group">
				        <label for="email">Email:</label>
				        <input type="email" class="form-control" placeholder="Enter email" name="email" required>
				        <div id="error_email">
				        	
				        </div>
				    </div>
				    <div class="form-group">
				        <label for="password">Password:</label>
				        <input type="password" class="form-control" placeholder="Enter password" name="password" required>
				        <div id="error_password">
				        	
				        </div>
				    </div>
				    <div class="form-group">
				        <label for="confirm_password">Confirm Password:</label>
				        <input type="password" class="form-control" placeholder="Enter confirm password" name="confirm_password" required>
				        <div id="error_confirm_password">
				        	
				        </div>
				    </div>
				    <button type="submit" class="btn btn-dark">Register</button>
				</form>
			</div>
			<div class="card-footer">
				<span class="font-italic">Already have an account? </span> 
				<a href="{{ route('login') }}"><button class="btn btn-dark">Login Here</button></a>
			</div>
		</div>
	</div>
@endsection

@push('script')
<script type="text/javascript">
	$.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
	$(document).ready(function(){
		$('#register_form').on('submit', function(event){
			event.preventDefault();
			$.ajax({
				url: 'register_post',
				data: new FormData(this),
                type: 'POST',
                dataType: 'JSON',
                contentType: false,
                cache: false,
                processData:false,
                success: function(result){
                	if(result.res_type == 'error')
                	{
                		if(result.response.email)
                		{
                			html = '';
                			html += '<div class="alert alert-warning" role="alert">';
                				html += result.response.email[0];
							html += '</div>';
							$('#error_email').html(html);
                		}
                		if(result.response.password)
                		{
                			html = '';
                			html += '<div class="alert alert-warning" role="alert">';
                				html += result.response.password[0];
							html += '</div>';
							$('#error_password').html(html);
                		}
                		if(result.response.confirm_password)
                		{
							html = '';
                			html += '<div class="alert alert-warning" role="alert">';
                				html += result.response.confirm_password[0];
							html += '</div>';
							$('#error_confirm_password').html(html);
                		}
                	}
                	else if(result.res_type == 'success')
                	{
                		toastr.success(result.response, 'Response');
                        setTimeout("$(location).attr('href','student');",200);
                	}
                }
			});
		});
	});
</script>
@endpush