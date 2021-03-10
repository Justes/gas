<?php

namespace App\Models;

class Attachment extends BaseModel {

	protected $appends = ['article_title', 'file_name', 'file_ext', 'post_user_name', 'file_url'];

	public function article() {
		return $this->belongsTo('App\Models\Article');
	}

	public function getArticleTitleAttribute() {
		return $this->article->title ?? '';
	}

	public function getFileNameAttribute() {
		$name = '';
		$arr = explode('.', $this->path);
		if(is_array($arr)) {
			$name = substr($arr[0], 6);
		}
		return $name;
	}

	public function getFileExtAttribute() {
		return ext($this->path);
	}

	public function getPostUserNameAttribute() {
		return $this->article->admin->name ?? '';
	}

	public function getFileUrlAttribute() {
		return \Storage::disk('admin')->url($this->path);
	}

}
