<style>
	.title {
		text-align:center;
		font-size:20px;
		font-weight:bold;
	}

	.mr20 {
		margin-right:20px;
	}
</style>

	<span style="float:right;">
		<a href="/admin/notices" class="btn btn-sm btn-default" title="列表">
			<i class="fa fa-list"></i><span class="hidden-xs"> 列表</span>
		</a>
	</span>

<div class="form-group" style='padding:20px;'>
	<div class="title">{{ $article->title }}</div>
	<div style="margin:10px;padding:10px; border: 1px solid #ccc;background-color:#f9f9f9">
@if($article->article_type == 0)
		<span class="mr20">类型: {{ $article->cate->cate_name }}</span>
@endif
		<span class="mr20">发布时间</span> <span>{{ $article->created_at }}</span>
	</div>

	<div style="margin:20px;">
		<div class="cntt">{!! $article->content !!}</div>
	</div>
</div>
