<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/css/vtornik.css">
    <link rel="stylesheet" href="/css/stl.css">
    <link rel="stylesheet" href="/css/vtornikMedia.css">
</head>
<body>
<div class="wrp">
    <main class="main">
        <div class="main__header">
            <a href="/listGamer">Общий рейтинг игроков</a>
        </div>
        <div class="rating-all">
            <div class="rating-all__header">

                <#if model.container?exists>
                    <a href="#" class="rating-all__icon" data-toggle="modal" data-target="#photo"><img class="competitionControl" src="/img/camera.png" alt=""></a>
                <#else>
                    <a href="/${model.competition.id}/photo" class="rating-all__icon" ><img class="competitionControl" src="/img/camera.png" alt=""></a>
                </#if>

                <h1>${model.competition.name}</h1>

                <div class="rating-all__control">
                    <a href="/edit/${model.competition.id}" class="js-edit"><img class="competitionControl" src="/img/edit.png" alt=""></a>
                    <a href="/delete/${model.competition.id}" data-toggle="modal" data-target="#deleteTournament"><img class="competitionControl" src="/img/close.png" alt=""></a>
                </div>

            </div>
            <div class="box">
                <div class="whiteLine"></div>
                <table>
                    <thead>
                    <td class="gamer"><span class="word">Игроки</span> <img class="icon" src="/img/user.png" alt=""> </td>
                    <td></td>
                    <#list model["results"] as result>
                        <td><span class="rotate">${result.nick}</span></td>
                    </#list>
                    <td class="a"><span class="word"><span class="rotate">${model["resource"].getString("Score")}</span> </span><img class="icon" src="/img/snooker.png" alt=""></td>
                    <td class="a"><span class="word"><span class="rotate">${model["resource"].getString("Deference")}</span></span><img class="icon" src="/img/pool.png" alt=""></td>
                    </thead>

                    <tbody>
                        <#list model["results"] as result>
                        <tr>
                            <td><span class="rotate">${result.nick}</span></td>
                            <td class="ctrln">
                                <div class="table__control">
                                    <#if result.dezhuril?exists>
                                        <a href="/${model.competition.id}/${result.id}/dezhurit">
                                            <div class="table__ok"></div>
                                        </a>
                                    <#else>
                                        <a href="/${model.competition.id}/${result.id}/cancellDezhurny">
                                            <div class="table__ok active" ></div>
                                        </a>
                                    </#if>
                                    <a href="/${model.competition.id}/${result.id}/excludePartner" onclick="document.getElementById('deletePayForm').action='/${model.competition.id}/${result.id}/excludePartner'"  data-toggle="modal" data-target="#deletePlay"><div class="table__close"></div></a>
                                </div>

                            </td>
                            <#list result.gameList as gamer2>
                                <td>
                                    <#if result.id==gamer2.idGamer>
                                        -
                                    <#else>

                                        <a onclick="document.getElementById('point1Label').innerHTML='${result.nick}',document.getElementById('point2Label').innerHTML='${gamer2.nickOfPartner2}', document.getElementById('pointsForm').action ='/${gamer2.idCompetition}/${result.id}/${gamer2.idGamer}/point'" href="/${gamer2.idCompetition}/${result.id}/${gamer2.idGamer}/point"    data-toggle="modal" data-target="#setPoint">
                                            ${gamer2.point1}:${gamer2.point2}
                                        </a>

                                    </#if>
                                </td>
                            </#list>
                                <td> ${result.agrBall}</td>
                                <td> ${result.deference}</td>
                            </tr>
                        </#list>
                        <tr>
                            <td>
                                <a href="/competition/${model.competition.id}/addGamers"><img src="/img/add.png" alt=""></a>
                            </td>
                        </tr>

                    </tbody>
                </table>
            </div>
    </main>
</div>



<!-- Добавить фото -->
            <div class="modal photo fade" id="photo" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-body">
                            <form class="rating-all__form" method="post" enctype="multipart/form-data" action="/${model.competition.id}/uploading">
                                <div class="rating-all__button" name="file">
                                    <label for="file"  name="file" class="img">
                                        <img src="/img/gallery.png" alt="">
                                    </label>
                                    <label for="file" name="file">Загрузить из галереи</label>

                                    <input type="file" name="file" onchange="this.form.submit()" id="file" style="display:none;"/>
                                </div>
                                <button type="button" class="rating-all__button">
                                    <div class="img"><img src="/img/photo-black.png" alt=""></div>
                                    Сделать фото
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>




<!-- Удалить турнир -->
            <div class="modal fade" id="deleteTournament" tabindex="-1" role="dialog" aria-labelledby="deleteTournamentLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="deleteTournamentLabel">Вы уверены,<br> что хотите удалить турнир?</h4>
                        </div>
                        <div class="modal-body">
                            <form class="rating-all__form" action="">
                                <button type="submit" class="rating-all__button" formaction="/delete/${model.competition.id}">Да</button>
                                <button type="button" class="rating-all__button" data-dismiss="modal" aria-label="Close">Нет</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>




<!-- Добавить счет игры -->
<div class="modal fade 2" id="setPoint" tabindex="-1" role="dialog" aria-labelledby="setPointLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="setPointLabel">Вы уверены,<br> что хотите удалить турнир?</h4>
            </div>
            <div class="modal-body">
                <form class="tournament__form" id="pointsForm" action="" method="post">
                        <p>
                            <label id="point1Label" for="point1"></label>
                            <input type="number" max="8" min="0" name="point1" id="point1" >
                        </p>
                        <p>
                            <label id="point2Label" for="point2"></label>
                            <input type="number" max="8"  min="0" name="point2" id="point2" >
                        </p>
                        <input class="tournament__submit"  type="submit" value="Ok"/>
                </form>
            </div>
        </div>
    </div>
</div>


<!-- Удалить игрока -->
<div class="modal fade" id="deletePlay" tabindex="-1" role="dialog" aria-labelledby="deletePlayLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="deletePlayLabel">Вы уверены,<br> что хотите удалить игрока?</h4>
            </div>
            <div class="modal-body">
                <form class="rating-all__form" id="deletePayForm" action="">
                    <button type="submit" class="rating-all__button">Да</button>
                    <button type="button" class="rating-all__button" data-dismiss="modal" aria-label="Close">Нет</button>
                </form>
            </div>
        </div>
    </div>
</div>



</div>
<script src="/js/vtornik.js"></script>
</body>
</html>
