﻿@model $rootnamespace$.ViewModel.Templates.DragAndDropMultiSelector.MultiSelectorWithSingleValueExtended

@{
    var controlPropertyName = ViewData.TemplateInfo.HtmlFieldPrefix.Replace('.', '_');
    var controlSelectedItemsPropertyName = controlPropertyName + ".SelectedItems";
    var controlAvailableItemsPropertyName = controlPropertyName + ".AvailableItems";

    var inlineSelectedItem = string.Empty;
    if (Model != null && Model.SelectedItems.Any())
    {
        foreach (var multiSelectorItem in Model.SelectedItems)
        {
            inlineSelectedItem += multiSelectorItem.Description + ", ";
        }
        inlineSelectedItem = inlineSelectedItem.TrimEnd(',', ' ');
    }
    else
    {
        inlineSelectedItem = "No selection";
    }

    var iconClass = string.Empty;
    if (ViewData["IconClass"] != null)
    {
        iconClass = (string)ViewData["IconClass"];
    }

    var isAllButtonsActivated = false;
    if (ViewData["IsAllButtonsActivated"] != null)
    {
        isAllButtonsActivated = Convert.ToBoolean(ViewData["IsAllButtonsActivated"]);
    }


    var javascriptFunctionNameOnItemCreate = string.Empty;
    if (ViewData["OnItemCreate"] != null)
    {
        javascriptFunctionNameOnItemCreate = (string)ViewData["OnItemCreate"];
    }

    <div id="gridMultiSelector-inputdescription"
         class="gridMultiSelector-description" 
         data-noselection-text="No selection"
         onclick=" gridMultiSelectorOnclick($(this).parent().parent().find('.gridMultiSelector-choice')) " 
        >
        @inlineSelectedItem
    </div>

    <div id="@controlPropertyName" class="gridMultiSelector-choice" data-onitemcreate-functionname="@javascriptFunctionNameOnItemCreate">
        <div class="gridMultiSelector-container-choice">
            <div class="gridMultiSelector-choice-single allselected">
                <h4>Selected</h4>
                @if (isAllButtonsActivated)
                {
                    <img src="@Url.Content("~/Content/Images/arrowAllRight.png")" 
                         class="allselectedButton" 
                         alt="Tranfert to the right" 
                         title="Transfer to the right"/>
                }
                <ul class="guid-multi-selector-selected connectedSortable" data-property-name="@controlSelectedItemsPropertyName">
                    @if (Model != null && Model.SelectedItems != null && Model.SelectedItems.Any())
                    {
                        for (var i = 0; i < Model.SelectedItems.Count(); i++)
                        {
                            var val = string.IsNullOrEmpty(Model.SelectedItems[i].ExtendedProperty) ? string.Empty : Model.SelectedItems[i].ExtendedProperty;
                            <li class="ui-state-default @iconClass" data-extended-value="@val">
                                <span class="description">@Model.SelectedItems[i].Description</span>
                                @Html.HiddenFor(x => Model.SelectedItems[i].ID)
                            </li>
                        }
                    }
                </ul>
            </div>
            <div class="gridMultiSelector-choice-single allavailable">
                @{ var styleh4 = ""; }
                @if (isAllButtonsActivated)
                {
                    <img src="@Url.Content("~/Content/Images/arrowAllLeft.png")"
                         class="allavailableButton"
                         alt="Transfert to the left"
                         title="Transfert to the left" />
                    styleh4 = "float:right;";
                }
                <h4 style="@styleh4">Available</h4>
 
                <ul class="guid-multi-selector-available connectedSortable" data-property-name="@controlAvailableItemsPropertyName">
                    @if (Model != null && Model.AvailableItems != null && Model.AvailableItems.Any())
                    {
                        for (var i = 0; i < Model.AvailableItems.Count(); i++)
                        {
                            var val = string.IsNullOrEmpty(Model.AvailableItems[i].ExtendedProperty) ? string.Empty : Model.AvailableItems[i].ExtendedProperty;
                            <li class="ui-state-default @iconClass" data-extended-value="@val">
                                <span class="description">@Model.AvailableItems[i].Description</span>
                                @Html.HiddenFor(x => Model.AvailableItems[i].ID)
                            </li>
                        }
                    }
                </ul>
            </div>
        </div>
        <div style="clear:both"></div>
        <span class="gridMultiSelector-message-information">Explication here</span>
    </div>
}
