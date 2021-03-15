({
    favorite: function (component, event, helper) {
        let obj = (JSON.parse(JSON.stringify(component.get("v.favArticle"))));
        let newObj = {
            "Name": obj.title,
            "Title__c": obj.title,
            "Author__c": obj.author,
            "Description__c": obj.description,
            "Article_Link__c": obj.url
        }
        
        let action = component.get("c.saveItem")
        action.setParams({ "article": newObj })
       
        action.setCallback(this, function (a) {
            var state = a.getState();
            //console.log("state", state)
            //console.log("a error", a.getError())
            if (state === "SUCCESS") {
                //component.getSource().set("v.disabled",true)
                let savedArticleEvent = component.getEvent("savedArticleEvent")
                savedArticleEvent.fire()
                //component.set("v.newArticles", refresh.getReturnValue())
                var artcl = a.getReturnValue();
                //console.log(artcl)
            }
        });
        $A.enqueueAction(action)
    },
    openModel: function (component, event, helper) {
        // for Display Model,set the "isOpen" attribute to "true"
        event.preventDefault();
        component.set("v.isOpen", true);
    },

    closeModel: function (component, event, helper) {
        // for Hide/Close Model,set the "isOpen" attribute to "Fasle"  
        component.set("v.isOpen", false);
    }
})