{
  "resourceType": "GMObject",
  "resourceVersion": "1.0",
  "name": "obj_player",
  "spriteId": {
    "name": "spr_santa",
    "path": "sprites/spr_santa/spr_santa.yy",
  },
  "solid": false,
  "visible": true,
  "managed": true,
  "spriteMaskId": null,
  "persistent": true,
  "parentObjectId": {
    "name": "obj_base",
    "path": "objects/obj_base/obj_base.yy",
  },
  "physicsObject": false,
  "physicsSensor": false,
  "physicsShape": 1,
  "physicsGroup": 1,
  "physicsDensity": 0.5,
  "physicsRestitution": 0.1,
  "physicsLinearDamping": 0.1,
  "physicsAngularDamping": 0.1,
  "physicsFriction": 0.2,
  "physicsStartAwake": true,
  "physicsKinematic": false,
  "physicsShapePoints": [],
  "eventList": [
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","isDnD":false,"eventNum":0,"eventType":0,"collisionObjectId":null,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","isDnD":false,"eventNum":0,"eventType":3,"collisionObjectId":null,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","isDnD":false,"eventNum":64,"eventType":8,"collisionObjectId":null,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","isDnD":false,"eventNum":4,"eventType":7,"collisionObjectId":null,},
  ],
  "properties": [
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"weapon","varType":0,"value":"noone","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"walkSpeed","varType":0,"value":"256","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"sprintSpeed","varType":0,"value":"384","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],},
  ],
  "overriddenProperties": [
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"maxSpeed","path":"objects/obj_base/obj_base.yy",},"objectId":{"name":"obj_base","path":"objects/obj_base/obj_base.yy",},"value":"256",},
  ],
  "parent": {
    "name": "Objects",
    "path": "folders/Objects.yy",
  },
}