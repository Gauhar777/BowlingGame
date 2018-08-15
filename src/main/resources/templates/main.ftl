<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
.collapsible {
    background-color: #777;
    color: white;
    cursor: pointer;
    padding: 18px;
    width: 100%;
    border: none;
    text-align: left;
    outline: none;
    font-size: 2em;
}

.active, .collapsible:hover {
    background-color: #555;
}

.content {
    padding: 0 18px;
    display: none;
    overflow: hidden;
    background-color: #f1f1f1;
}
</style>

</head>
<body>
    <#list model["competitionList"] as competition>
        <button class="collapsible">${competition.name}</button>
        <div class="content">
            <a href="/Competition/${competition.id}/showGames">
                <button type="button" class="btn btn-primary">
                    <img src="/images/scoreboard.png">
                </button>
            </a>
            <a href="edit/${competition.id}">
                <button type="button" class="btn btn-primary">
                    <img src="/images/settings.png">
                </button>
            </a>
        </div>
    </#list>

<script>
var coll = document.getElementsByClassName("collapsible");
var i;

for (i = 0; i < coll.length; i++) {
    coll[i].addEventListener("click", function() {
        this.classList.toggle("active");
        var content = this.nextElementSibling;
        if (content.style.display === "block") {
            content.style.display = "none";
        } else {
            content.style.display = "block";
        }
    });
}
</script>

</body>
</html>

