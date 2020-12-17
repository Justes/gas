<?php

namespace App\Models;
use Encore\Admin\Traits\ModelTree;

class Organ extends BaseModel {

	use ModelTree;

	public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);

        $this->setParentColumn('pid');
        $this->setOrderColumn('sort');
        $this->setTitleColumn('organ_name');
    }
}
