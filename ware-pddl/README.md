# Description

There are trucks that can move between several locations. In each location, there can be packages or crates. A truck can do the following actions:
a Drive: A truck can drive to any location as long as it is secured. A truck is secured if it is either empty or carrying a crate inside it.
b Lift: The truck has one crane that can lift either one package or one crate. The truck and the item being lifted must be at the same location. The truck must be secured before it can lift anything. The truck stops being secured when lifting an item.
c FillCrate: The truck can put a package inside a crate as long as the truck, the crate and the package are at the same location, and the package is currently lifted by the truck. The truck becomes secured as well.
d DropCrate: The truck can drop a crate at a location as long as the crate is secured into the truck, and the truck is at that location.
e Secure: A truck can secure a crate into itself if it is currently lifting it. Then, the crate stops being lifted by the truck’s crane, and the truck becomes secured.