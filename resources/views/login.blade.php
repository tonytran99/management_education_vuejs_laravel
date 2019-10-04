@extends('master')

@section('title', 'Login')

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
				<span class="text-uppercase">Login</span>
			</div>
			<div class="card-body">
				<form id="login_form">
				    <div class="form-group">
				        <label for="email">Email:</label>
				        <input type="email" class="form-control" placeholder="Enter email" name="email" required>
				    </div>
				    <div class="form-group">
				        <label for="password">Password:</label>
				        <input type="password" class="form-control" placeholder="Enter password" name="password" required>
				        <div id="error_password">
				        	
				        </div>
				    </div>
				    <div class="form-group form-check">
				        <label class="form-check-label">
				            <input class="form-check-input" type="checkbox" name="remember"> Remember me
				        </label>
				    </div>
				    <button type="submit" class="btn btn-dark">Login</button>
				</form>
			</div>
			<div class="card-footer">
				<span class="font-italic">Don't have an account! </span> 
				<a href="{{ route('register') }}"><button class="btn btn-dark">Register Here</button></a>
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
		$('#login_form').on('submit', function(event){
			event.preventDefault();
			$.ajax({
				url: 'login_post',
				data: new FormData(this),
                type: 'POST',
                dataType: 'JSON',
                contentType: false,
                cache: false,
                processData:false,
                success: function(result){
                	if(result.res_type == 'error')
                	{
                		if(result.response.password)
                		{
                			html = '';
                			html += '<div class="alert alert-warning" role="alert">';
                				html += result.response.password[0];
							html += '</div>';
							$('#error_password').html(html);
                		}
                		else
                		{
                			toastr.error(result.response, 'Response');
                		}
                	}
                	else if(result.res_type == 'success')
                	{
                		if(result.role == 0)
                		{
                			toastr.success(result.response, 'Response');
                        	setTimeout("$(location).attr('href','student');",200);
                		}
                		else if(result.role == 1)
                		{
                			toastr.success(result.response, 'Response');
                        	setTimeout("$(location).attr('href','admin');",200);
                		}
                	}
                }
			});
		});
	});
</script>
@endpush