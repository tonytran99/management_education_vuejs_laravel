@extends('master')

@section('title', 'Student')

@push('style')
<style type="text/css">

</style>
@endpush

@section('content')
	<div id="student">
		<Studentheader></Studentheader>
		<div class="container" style="min-height: 87vh;">
			<router-view :data="{{Auth::user()->id}}"></router-view>
		</div>
		<Studentfooter></Studentfooter>
	</div>
@endsection

@push('script')
<script type="text/javascript">
	
</script>
@endpush