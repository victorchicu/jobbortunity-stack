rs.initiate({_id: "rs0", members: [{ _id: 0, host: "mongo:27017" }]});
db.getSiblingDB("admin").createUser({
    user: _getEnv("MONGO_INITDB_ROOT_USERNAME") || "admin",
    pwd:  _getEnv("MONGO_INITDB_ROOT_PASSWORD") || "admin",
    roles: [{ role: "root", db: "admin" }]
});