<?php

namespace Encore\Admin\Grid\Tools;

use Encore\Admin\Admin;
use Encore\Admin\Grid;

class PerPageSelector extends AbstractTool
{
    /**
     * @var string
     */
    protected $perPage;

    /**
     * @var string
     */
    protected $perPageName = '';

    /**
     * Create a new PerPageSelector instance.
     *
     * @param Grid $grid
     */
    public function __construct(Grid $grid)
    {
        $this->grid = $grid;

        $this->initialize();
    }

    /**
     * Do initialize work.
     *
     * @return void
     */
    protected function initialize()
    {
        $this->perPageName = $this->grid->model()->getPerPageName();

        $this->perPage = (int) \request()->input(
            $this->perPageName,
            $this->grid->perPage
        );
    }

    /**
     * Get options for selector.
     *
     * @return static
     */
    public function getOptions()
    {
        return collect($this->grid->perPages)
            ->push($this->grid->perPage)
            ->push($this->perPage)
            ->unique()
            ->sort();
    }

    /**
     * Render PerPageSelector。
     *
     * @return string
     */
    public function render()
    {
        Admin::script($this->script());        
        
        $trans = [
            'show'    => trans('admin.show'),
            'entries' => trans('admin.entries'),
        ];
        $options = $this->getOptions()->map(function ($option) {
            $selected = ($option == $this->perPage) ? 'selected' : '';
            $url = \request()->fullUrlWithQuery([$this->perPageName => $option]);

            return "<option value=\"$url\" $selected>$option"."条/页"."</option>";
        })->implode("\r\n");

        return <<<EOT

<label class="control-label pull-right" style="margin-right: 10px; font-weight: 100;">

        <select class="input-sm {$this->grid->getPerPageName()}" name="per-page">
            $options
        </select>

    </label>

EOT;
    }

    /**
     * Script of PerPageSelector.
     *
     * @return string
     */
    protected function script()
    {
        return <<<EOT

$('.{$this->grid->getPerPageName()}').on("change", function(e) {
    $.pjax({url: this.value, container: '#pjax-container'});
});

EOT;
    }
}
