@extends('layouts.admin')

@section('content')

<!-- Main content -->
<section class="content">

    <!-- Default box -->
    <div class="card">
    <div class="card-body p-0">
        <table class="min-w-max w-full table-auto">
            <thead>
                <tr class="bg-gray-200 text-gray-600 uppercase text-sm leading-normal">
                    <th class="py-3 px-6 text-left">
                        User
                    </th>
                    <th class="py-3 px-6 text-left">
                        Email
                    </th>
                    <th class="py-3 px-6 text-left">
                        Product
                    </th>
                    <th class="py-3 px-6 text-left">
                        Details
                    </th>
                    <th class="py-3 px-6 text-center"></th>
                </tr>
            </thead>
            <tbody class="text-gray-600 text-sm font-light">
                @if (count($reports) > 0)
                    @foreach ($reports as $report)
                    <tr class="border-b border-gray-200 hover:bg-gray-100">
                        <td class="py-3 px-6 text-left">
                            {{ $report["user"]["fullname"] }}
                        </td>
                        <td class="py-3 px-6 text-left">
                            {{ $report["user"]["email"] }}
                        </td>
                        <td class="py-3 px-6 text-left">
                           <img 
                                class="w-10 h-10 rounded-full" 
                                src="{{$report->product['images'][0]}}" 
                                alt="{{ $report->product['name'] }}" />
                        </td>
                        <td class="py-3 px-6 text-left">
                            {{ $report["details"] }}
                        </td>
                        <td class="py-3 px-6 text-center">
                            <div class="flex item-center justify-center">
                                <a href="/admin/reports/{{ $report->id }}/view" class="w-4 mr-2 transform hover:text-purple-500 hover:scale-110">
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                                    </svg>
                                </a>
                            </div>
                            {{-- <a class="btn btn-info btn-sm" href="/admin/reports/{{ $report['id'] }}/edit">
                                <i class="fas fa-pencil-alt">
                                </i>
                                Edit
                            </a>
                            <form style="display:inline" method="POST" action="{{ route('reports.destroy', $report->id) }}">
                                @method('DELETE')
                                @csrf
                                <button class="btn btn-danger btn-sm" type="submit">
                                    <i class="fas fa-trash">
                                    </i>
                                    Delete
                                </button>
                            </form> --}}
                        </td>
                    </tr>
                    @endforeach
                @else
                <tr class="brequest-b brequest-gray-200 hover:bg-gray-100"><td colspan="5" class="py-3 px-6 text-left">No reports found!</td></tr>
                @endif
            </tbody>
        </table>
        <div class="my-3 mx-3">
            {!! $reports->links() !!}
        </div>
    </div>
    <!-- /.card-body -->
    </div>
    <!-- /.card -->

</section>

<!-- /.content -->
@endsection


