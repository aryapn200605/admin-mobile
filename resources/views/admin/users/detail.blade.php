@extends('layouts.panel')

@section('title', 'Detail Pengguna')

@section('content')

    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <form>
                        <div class="form-group">
                            <label>ID</label>
                            <input type="text" class="form-control" value="{{ $users->id }}" disabled>
                        </div>
                        <div class="form-group">
                            <label>USERNAME</label>
                            <input type="text" class="form-control" value="{{ $users->username }}" disabled>
                        </div>
                        <div class="form-group">
                            <label>EMAIL</label>
                            <input type="text" class="form-control" value="{{ $users->email }}" disabled>
                        </div>
                        <div class="form-group">
                            <label>FIRST NAME</label>
                            <input type="text" class="form-control" value="{{ $users->first_name }}" disabled>
                        </div>
                        <div class="form-group">
                            <label>LAST NAME</label>
                            <input type="text" class="form-control" value="{{ $users->last_name }}" disabled>
                        </div>
                        <div class="form-group">
                            <label>TENANTS</label>
                            <input type="text" class="form-control" value="{{ $users->tenants }}" disabled>
                        </div>
                        <a href="{{ url('/user/management') }}" class="btn btn-secondary">Back</a>
                    </form>
                </div>
            </div>
        </div>
    </div>

@endsection

@section('script')
    <script></script>
@endsection
