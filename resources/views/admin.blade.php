@extends('master')

@section('title', 'Admin')

@push('style')
<style type="text/css">

</style>
@endpush

@section('content')
	<div id="admin">
		<Adminheader></Adminheader>
		<div class="container" style="min-height: 87vh;">
			<router-view></router-view>
		</div>
		<Adminfooter></Adminfooter>
	</div>
@endsection

@push('script')
<script type="text/javascript">
	
</script>
@endpush