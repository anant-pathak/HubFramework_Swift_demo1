# HubFramework_Swift_demo1

####NEW Updates: <br/>
#####1) In Cities Page: Created a Carousel component using CollectionView whose cells are another independent component. Interesting point being that Cell Component(which includes Labels etc.) is using a XIB to load itself up. NOTE: Creating a cell from the Code itself and AutoConstraints using VFL is coming up as well. If I might forget then just remind me ;)<br/>
#####2) Since the cell on the Carousel component(UICollectionView) is an independent component hence in the Cities Page just below the carousel an independent cell is also loaded up.<br/>
#####3) The food page has been divided into two sections: although both of them are getting data for the models from JSON files, in one of them the JSON file is in a standard JSON format which is easily understood by the HUbFramework & the other JSON file is a custom one, for which there is a Custom Schema as well to specify the mappings for Hub to comprehend. <br/>

### Previous updates:
I have tried to replicate the example given in "https://spotify.github.io/HubFramework/getting-started-guide.html" under the original HUBFramework repositery 
in addition have some of my own components & implementations like: <br />

#####1) How to design a component[Banner] using XIB interface & use it as a widget in the component file[ComponentBanner]. <br />
#####2) How to use local image as an image resource for your component in the [ComponentBanner] whereas the image was given to the MODEL in the [CitiesContentOperation] @the end.


Want to use my project?? <br />
```
git clone https://github.com/anantthebiker/HubFramework_Swift_demo1.git 
```
