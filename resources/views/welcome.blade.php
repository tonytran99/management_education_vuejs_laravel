@extends('master')

@section('title', 'Welcome')

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
        <div class="container text-center">
            <div class="jumbotron">
                <h3>Welcome To Management Education VueJS & Laravel</h3>
                <div class="row">
                    <div class="col-6 text-center">
                        <a href="{{ route('login') }}"><button class="btn btn-dark">LOGIN</button></a>
                    </div>
                    <div class="col-6 text-center">
                        <a href="{{ route('register') }}"><button class="btn btn-dark">REGISTER</button></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('script')
<script type="text/javascript">
    
</script>
@endpush