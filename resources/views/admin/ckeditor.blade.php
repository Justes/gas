<div class="form-group {!! !$errors->has($errorKey) ?: 'has-error' !!}">

    <label for="{{$id}}" class="col-sm-2 control-label">{{$label}}</label>

    <div class="col-sm-6">

        @include('admin::form.error')

        <textarea class="form-control {{ $class }}" name="{{$name}}" placeholder="{{ $placeholder }}" {!! $attributes !!} >{{ old($column, $value) }}</textarea>

        @include('admin::form.help-block')

    </div>
</div>
<script src="/packages/ckeditor/ckeditor.js"></script>   
<script src="/packages/ckeditor/adapters/jquery.js"></script>  
<script type="text/javascript">
$(function(){
	$('textarea.{{$name}}').ckeditor();
});
</script>
