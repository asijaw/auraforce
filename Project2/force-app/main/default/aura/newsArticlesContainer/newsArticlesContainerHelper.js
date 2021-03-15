({
    handleSavedArticles: function(component, event, helper){
        let favArticles = component.get("c.getMyArticles");
        favArticles.setCallback(this, function(data){
            console.log(data.getReturnValue())
            component.set("v.favorites", data.getReturnValue());
            $A.enqueueAction(favArticles);
        });
    }
})
