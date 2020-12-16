<?php

namespace App\Models;

class Article extends BaseModel {

	protected $appends = ['cate_name', 'effect_type_text', 'send_type_text', 'receive_type_text', 'post_user_name', 'post_status_text'];
	public $effectArr = ['永久', '限时有效'];
	public $sendArr = ['即时', '定时'];
	public $receiveArr = ['全部', '指定人'];
	public $postArr = ['已发布', '草稿'];

	public function cate() {
		return $this->hasOne('App\Models\Category', 'id', 'cate_id');
	}

	public function admin() {
		return $this->hasOne('App\Models\AdminUser', 'id', 'post_user_id');
	}

	public function attachments() {
        return $this->hasMany(Attachment::class);
    }

	public function getEffectTypeTextAttribute() {
		return $this->effectArr[$this->effect_type];
	}

	public function getSendTypeTextAttribute() {
		return $this->sendArr[$this->send_type];
	}

	public function getReceiveTypeTextAttribute() {
		return $this->receiveArr[$this->receive_type];
	}

	public function getCateNameAttribute() {
		return $this->cate->cate_name ?? '';
	}

	public function setReceiveUserIdsAttribute($value) {
        $this->attributes['receive_user_ids'] = implode(',', $value);
    }

	public function getReceiveUserIdsAttribute($value) {
        return array_filter(explode(',', $value));
    }

	public function getPostUserNameAttribute() {
		return $this->admin->name ?? '';
	}

	public function getPostStatusTextAttribute() {
		return $this->postArr[$this->post_status];
	}
}
