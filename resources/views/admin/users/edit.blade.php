@extends('layouts.panel')

@section('title', 'Ubah Pengguna')

@section('content')

    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <form method="POST" action="{{ url('/user/update/' . $user->id) }}">
                        @csrf
                        @method('PATCH')
                        <div class="form-group">
                            <label>ID</label>
                            <input type="text" name="id" class="form-control" value="{{ $user->id }}" disabled>
                        </div>
                        <div class="form-group">
                            <label>USERNAME</label>
                            <input type="text" name="username" class="form-control" value="{{ $user->username }}">
                        </div>
                        <div class="form-group">
                            <label>EMAIL</label>
                            <input type="text" name="email" class="form-control" value="{{ $user->email }}">
                        </div>
                        <div class="form-group">
                            <label>FIRST NAME</label>
                            <input type="text" name="first_name" class="form-control" value="{{ $user->first_name }}">
                        </div>
                        <div class="form-group">
                            <label>LAST NAME</label>
                            <input type="text" name="last_name" class="form-control" value="{{ $user->last_name }}">
                        </div>
                        <div class="form-group">
                            <label>TENANTS</label>
                            <input type="text" name="tenants" class="form-control" value="{{ $user->tenants }}" disabled>
                        </div>
                        <div style="display: flex; justify-content: space-between;">
                            <a href="{{ url('/user/management') }}" class="btn btn-secondary">Back</a>
                            <button type="submit" class="btn btn-success">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

@endsection

@section('script')
    <script></script>
@endsection
