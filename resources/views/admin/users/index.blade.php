@extends('layouts.panel')

@section('title', 'Manajemen Pengguna')

@section('content')

    <div class="row">
        <div class="col-12">
            <div class="card">
                <!-- /.card-header -->
                <div class="card-body">
                    <table id="datatable" class="table table-bordered table-striped">
                        <thead>
                            <tr class="text-center">
                                <th>No</th>
                                <th>CIF</th>
                                <th>Nama</th>
                                <th>Username</th>
                                <th>Alamat</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $no = 0; ?>
                            @foreach ($users as $key => $user)
                                <tr>
                                    <td class="text-center w-1">{{ ++$no }}</td>
                                    <td>{{ $user->cif }}</td>
                                    <td>{{ $user->first_name }}</td>
                                    <td>{{ $user->username }}</td>
                                    <td>{{ $user->address }}</td>
                                    <td class="text-center">
                                        <a href="{{ url('/user/detail/' . $user->id) }}" class="btn btn-sm btn-success">Detail</a>
                                        <a href="{{ url('/user/edit/' . $user->id) }}" class="btn btn-sm btn-primary">Edit</a>
                                        {{-- <a href="{{url('/user/delete/' . $user->id)}}" id="delete" class="btn btn-danger">Delete</a> --}}
                                        <button class="btn btn-sm btn-danger" id="delete"
                                            value="{{ $user->id }}" data-val="user">Delete</button>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
                <!-- /.card-body -->
            </div>
        </div>
    </div>

@endsection

@section('script')
    <script>
     $('button[id^="delete"]').on("click", function() {
            let val = $(this).data("val");
            let id = $(this).val()

            Swal.fire({
                title: 'Ingin Menghapus User Ini?',
                showCancelButton: true,
                confirmButtonText: 'Hapus',
                cancelButtonText: 'Batal',
                icon: 'question'
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        url: `{{ url('/${val}/delete/') }}`,
                        data: {
                            id: id
                        },
                        type: 'GET',
                    }).then(() => {
                        Swal.fire({
                            icon: 'success',
                            confirmButtonText: 'Ok',
                            title: 'Berhasil Di Hapus!',
                            showConfirmButton: false
                        })
                        setTimeout(() => {
                            location.reload()
                        }, 1000);
                    })
                }
            })
        })
    </script>
@endsection
