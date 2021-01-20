<style>
	.title {
		text-align:center;
		font-size:16px;
		font-weight:bold;
	}

	.cntt {
		margin: 20px
	}
	a {
		text-decoration:none;
		color:#333;
	}
</style>
<div class="form-group">

<!--
	<div class="btn-group" style="margin-right: 5px" data-toggle="buttons">
    <label class="btn btn-sm btn-dropbox 5fd86da14548b-filter-btn " title="筛选">
        <input type="checkbox"><i class="fa fa-filter"></i><span class="hidden-xs">  筛选</span>
    </label>

    </div>
-->

    <div class="box-header with-border filter-box" id="filter-box">
    <form action="/admin/notices" class="form-horizontal" pjax-container method="get">
        <div class="row">
			<div class="col-md-12">
                <div class="box-body">
                    <div class="fields-group">
						<div class="form-group">
							<label class="col-sm-2 control-label"> 类型</label>
							<div class="col-sm-8">
								<select class="form-control article_type" name="article_type" style="width: 100%;">
								@foreach($types as $key => $type)
								<option value="{{ $key }}" @if($key == $articleType) selected @endif>{{ $type }}</option>
								@endforeach
								</select>   
							</div>
						</div>
					</div>
                </div>
            </div>
		</div>

		<div class="row">
			<div class="col-md-12">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<div class="pull-left">
						<button class="btn btn-info submit btn-sm"><i class="fa fa-search"></i>  搜索</button>
					</div>
					<div class="btn-group pull-left " style="margin-left: 10px;">
						<a href="http://gas.com/admin/notices" class="btn btn-default btn-sm"><i class="fa fa-undo"></i>  重置</a>
					</div>
				</div>
			</div>
		</div>
	</form>
	</div>


	@foreach($articles as $item)
	<div style="margin:10px;padding:10px; border-bottom: 1px solid #ccc">
		<span style="font-weight:bold;margin-right:20px;">接收时间</span> <span style="color:red">{{ $item->created_at }}</span>
	</div>

	<div style="margin:20px;">
		<div class="title"><a href="/admin/notices/{{ $item->id }}">{{ $item->title }}</a></div>
		<div class="cntt"><a href="/admin/notices/{{ $item->id }}">{!! $item->content !!}</a></div>
	</div>
	@endforeach
</div>

<div class="box-footer" style='float:right'>
	{{ $articles->links() }}
</div>

<!--

    <div class="box-footer clearfix">
		从 <b>{{ $articles->firstItem() }}</b> 到 <b> {{ $articles->lastItem() }}</b> ，总共 <b>{{ $articles->total() }}</b> 条
		<ul class="pagination pagination-sm no-margin pull-right">
			<li class="page-item disabled"><span class="page-link">«</span></li>
			<li class="page-item active"><span class="page-link">1</span></li>
			<li class="page-item disabled"><span class="page-link">»</span></li>
		</ul>

		<label class="control-label pull-right" style="margin-right: 10px; font-weight: 100;">
        <small>显示</small> 
        <select class="input-sm grid-per-pager" name="per-page">
			@foreach($pers as $p)
				<option value="/admin/notices?per_page={{ $p }}" @if($p == $per) selected @endif>{{ $p }}</option>
			@endforeach
        </select>
         <small>条</small>
		</label>
	</div>
-->


<script>
$('.grid-per-pager').on("change", function(e) {
    $.pjax({url: this.value, container: '#pjax-container'});
});

$(function() {
	$('.pagination').addClass('pagination-sm');

    $(".article_type").select2({
      placeholder: {"id":"","text":"\u9009\u62e9"},
      "allowClear":true
    });
});

</script>
