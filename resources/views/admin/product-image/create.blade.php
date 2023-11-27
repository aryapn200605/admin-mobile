@extends('layouts.panel')

@section('title', 'Tambah Gambar Produk')

@section('content')

    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <form action="{{ url('/product-image/store') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="row">
                            <div class="col-6">
                                <div class="form-group">
                                    <div class="input-group mb-3">
                                        <input type="text" class="form-control" placeholder="Judul" name="title"
                                            aria-label="Judul">
                                    </div>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <div class="input-group mb-3">
                                        <input type="file" class="form-control-file" name="name">
                                    </div>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Dimulai Pada</span>
                                        </div>
                                        <input type="datetime-local" class="form-control" name="start_at"
                                            aria-label="Dimulai Pada">
                                    </div>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Diakhiri Pada</span>
                                        </div>
                                        <input type="datetime-local" class="form-control" name="end_at"
                                            aria-label="Diakhiri Pada">
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 mb-3">
                                <textarea id="summernote" name="description" rows="10">
                                  </textarea>
                            </div>
                            <div class="col-12">
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

@endsection

@section('script')
    <script>
    </script>
@endsection
