@extends('layouts.panel')

@section('title', 'Gambar Produk')

@section('header-item')
    <a href="{{ url('/product-image/create') }}" class="btn btn-primary float-right mb-3">Tambah Gambar Produk</a>
@endsection

@section('content')

    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <table id="datatable" class="table table-bordered table-striped">
                        <thead>
                            <tr class="text-center">
                                <th style="width: 1%">No</th>
                                <th style="width: 30%">Gambar</th>
                                <th style="width: 10%">Judul</th>
                                <th style="width: 15%">Tanggal Mulai</th>
                                <th style="width: 15%">Tanggal Berakhir</th>
                                {{-- <th style="width: 9%">Aksi</th> --}}
                            </tr>
                        </thead>
                        <tbody>
                            <?php $no = 0; ?>
                            @foreach ($datas as $key => $data)
                                <tr>
                                    <td class="text-center w-1">{{ ++$no }}</td>
                                    <td><img src="{{ asset($data->name) }}" alt="Image" width="50%"></td>
                                    <td>{{ $data->title }}</td>
                                    <td>{{ $data->start_at }}</td>
                                    <td>{{ $data->end_at }}</td>
                                    {{-- <td class="text-center">
                                        @if ($data->status == 'active')
                                            <button id="{{ $data->id }}"
                                                class="btn btn-danger choose-btn non-active">Non
                                                Aktifkan</button>
                                        @else
                                            <button id="{{ $data->id }}" type="button" data-toggle="modal"
                                                data-target="#activateModal" class="btn btn-success choose-btn active">
                                                Aktifkan</button>
                                        @endif
                                    </td> --}}
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="activateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ubah Tanggal Berakhir</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <input type="datetime-local" class="form-control" name="end_at" id="end_at" required
                        placeholder="Masukkan Tanggal Perubahan">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
                    <button type="button" class="btn btn-primary" id="submit">Save changes</button>
                </div>
            </div>
        </div>
    </div>

@endsection

@section('script')
    <script>
        let id;
        $('.active').on("click", function() {
            id = $(this).attr('id');
        });

        $('#submit').on("click", function() {
            let end_at = $('#end_at').val();

            $.ajax({
                url: "{{ url('/product-image/update/') }}" + "/" + id,
                type: "PATCH",
                data: {
                    _token: "{{ csrf_token() }}",
                    id: id,
                    end_at: end_at
                }
            }).then((result) => {
                let data = JSON.parse(result);

                if (data.status === 'success') {
                    Swal.fire({
                        icon: 'success',
                        title: 'Sukses!',
                        text: 'Berhasil Mengubah Tanggal Berakhir!',
                    });
                } else if (data.status === 'failed') {
                    Swal.fire({
                        icon: 'error',
                        title: 'Gagal!',
                        text: 'Gagal Mengubah Tanggal Berakhir!',
                    });
                }

                setTimeout(() => {
                    window.location.reload();
                }, 2000);
            }).catch(() => {
                alert('Server Error');
            });
        });
    </script>

@endsection
