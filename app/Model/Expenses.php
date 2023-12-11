<?php

// namespace App;

// use Illuminate\Database\Eloquent\Factories\HasFactory;
// use Illuminate\Database\Eloquent\Model;

namespace App\Model;

use App\CPU\Helpers;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\DB;

class Expenses extends Model
{
    // use HasFactory;
    // protected $casts = [
    //     'exchange_rate' => 'float',
    //     'status'        => 'integer',
    //     'created_at'    => 'datetime',
    //     'updated_at'    => 'datetime',
    // ];
    protected $table = 'expenses';
}
