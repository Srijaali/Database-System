-- q1
use inventoryDB

db.furniture.insertMany([
  { name: "Table", color: "Brown", dimensions: [40, 80] },
  { name: "Chair", color: "White", dimensions: [30, 45] },
  { name: "Sofa",  color: "Gray",  dimensions: [60, 120] }
])

-- q2
db.furniture.insertOne({
  name: "Desk",
  color: "Brown",
  dimensions: [50, 100]
})

--q3
db.furniture.find({
  "dimensions.0": { $gt: 30 }
})

-- q4
db.furniture.find({
  color: "Brown",
  name: { $in: ["Table", "Chair"] }
})

--q5
db.furniture.updateOne(
  { name: "Table" },
  { $set: { color: "Ivory" } }
)

--q6
db.furniture.updateMany(
  { color: "Brown" },
  { $set: { color: "Dark Brown" } }
)

--q7
db.furniture.deleteOne(
  { name: "Chair" }
)

-- q8
db.furniture.deleteMany({
  dimensions: [12, 18]
})

-- q9
db.furniture.aggregate([
  {
    $group: {
      _id: "$color",
      total_items: { $sum: 1 }
    }
  }
])

-- q10
db.furniture.createIndex({
  name: "text"
})
db.furniture.find({
  $text: { $search: "table" }
})
