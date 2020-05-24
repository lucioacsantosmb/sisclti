<?php
/**
 * Admin
 * Gerenciamento de Admin
 * admin.class.php
 * 99242991 | Lúcio ALEXANDRE Correia dos Santos
**/

/* Classe de interação com o PostgreSQL */
require_once "../class/pgsql.class.php";
$pg = new PgSql();

/* Recupera informações dos Admin */
$sql = "SELECT * FROM db_clti.tb_pessoal_ti";

$row = $pg->getRow($sql);

@$act = $_GET['act'];

/* Checa se há Admin cadastrado */
if (($row == '0') AND ($act == NULL)) {
	echo "<h5>Não há Pessoal de TI cadastrado,<br />
		 clique <a href=\"?cmd=pessoalti&act=cad\">aqui</a> para fazê-lo.</h5>";
}

/* Carrega form para cadastro de Admin */
if ($act == 'cad') {
    @$param = $_GET['param'];
    if ($param){
        $admin_idlogin = $_SESSION['user_id'];
        $admin_idom = $_SESSION['id_om_apoiada'];
        $admin_siglaom = $_SESSION['om_apoiada'];
        $pesti = $pg->getRow("SELECT * FROM db_clti.tb_pessoal_ti WHERE idtb_pessoal_ti = '$param'");
        $pesti_om = $pg->getRow("SELECT idtb_om_apoiadas,sigla FROM db_clti.tb_om_apoiadas 
            WHERE idtb_om_apoiadas = '$admin->id_om'");
        $pesti_posto_grad = $pg->getRow("SELECT idtb_posto_grad,sigla FROM db_clti.tb_posto_grad 
            WHERE idtb_posto_grad = '$admin->id_posto_grad'");
        $pesti_corpo_quadro = $pg->getRow("SELECT idtb_corpo_quadro,sigla FROM db_clti.tb_corpo_quadro 
            WHERE idtb_corpo_quadro = '$admin->id_corpo_quadro'");
        $pesti_especialidade = $pg->getRow("SELECT idtb_especialidade,sigla FROM db_clti.tb_especialidade 
            WHERE idtb_especialidade = '$admin->id_especialidade'");
    }
    else{
        $admin_idlogin = $_SESSION['user_id'];
        $admin_idom = $_SESSION['id_om_apoiada'];
        $admin_siglaom = $_SESSION['om_apoiada'];
        $pesti = (object)['idtb_pessoal_ti'=>'','nip'=>'','cpf'=>'','nome'=>'','nome_guerra'=>''];
        $pesti_om = (object)['idtb_om_apoiadas'=>'','sigla'=>''];
        $pesti_posto_grad = (object)['idtb_posto_grad'=>'8','sigla'=>'1ºTen'];
        $pesti_corpo_quadro = (object)['idtb_corpo_quadro'=>'','sigla'=>''];
        $pesti_especialidade = (object)['idtb_especialidade'=>'','sigla'=>''];
    }
	$omapoiada = "SELECT * FROM db_clti.tb_om_apoiadas ORDER BY sigla ASC";
    $omapoiada = $pg->getRows($omapoiada);
    $postograd = "SELECT * FROM db_clti.tb_posto_grad ORDER BY idtb_posto_grad 	DESC";
    $postograd = $pg->getRows($postograd);
    $corpoquadro = "SELECT * FROM db_clti.tb_corpo_quadro";
    $corpoquadro = $pg->getRows($corpoquadro);
    $especialidade = "SELECT * FROM db_clti.tb_especialidade ORDER BY nome ASC";
    $especialidade = $pg->getRows($especialidade);
    echo "
	<div class=\"container-fluid\">
        <div class=\"row\">
            <main>
                <div id=\"form-cadastro\">
                    <form id=\"insereusuario\" role=\"form\" action=\"?cmd=pessoalti&act=insert\" 
                        method=\"post\" enctype=\"multipart/form-data\">
                        <fieldset>";

                            if ($param){
                                echo"
                                <legend>Pessoal de TI - Alteração</legend>

                                <div class=\"form-group\">
                                    <label for=\"omapoiada\">OM Apoiada:</label>
                                    <select id=\"omapoiada\" class=\"form-control\" name=\"omapoiada\">
                                        <option value=\"$admin_idom\" selected=\"true\">$admin_siglaom</option>";
                                        foreach ($omapoiada as $key => $value) {
                                            echo"<option value=\"".$value->idtb_om_apoiadas."\">
                                                ".$value->sigla."</option>";
                                        };
                                    echo "</select>
                                </div>

                                <div class=\"form-group\">
                                    <label for=\"postograd\">Posto/Graduação:</label>
                                    <select id=\"postograd\" class=\"form-control\" name=\"postograd\">
                                        <option value=\"$pesti_posto_grad->idtb_posto_grad\" selected=\"true\">
                                            $pesti_posto_grad->sigla</option>";
                                        foreach ($postograd as $key => $value) {
                                            echo"<option value=\"".$value->idtb_posto_grad."\">
                                                ".$value->nome."</option>";
                                        };
                                    echo "</select>
                                </div>

                                <div class=\"form-group\">
                                    <label for=\"corpoquadro\">Corpo/Quadro:</label>
                                    <select id=\"corpoquadro\" class=\"form-control\" name=\"corpoquadro\">
                                        <option value=\"$pesti_corpo_quadro->idtb_corpo_quadro\" selected=\"true\">
                                            $pesti_corpo_quadro->sigla</option>";
                                        foreach ($corpoquadro as $key => $value) {
                                            echo"<option value=\"".$value->idtb_corpo_quadro."\">
                                                ".$value->nome."</option>";
                                        };
                                    echo "</select>
                                </div>

                                <div class=\"form-group\">
                                    <label for=\"especialidade\">Especialidade:</label>
                                    <select id=\"especialidade\" class=\"form-control\" name=\"especialidade\">
                                        <option value=\"$pesti_especialidade->idtb_especialidade\" selected=\"true\">
                                            $pesti_especialidade->sigla</option>";
                                        foreach ($especialidade as $key => $value) {
                                            echo"<option value=\"".$value->idtb_especialidade."\">
                                                ".$value->nome."</option>";
                                        };
                                    echo "</select>
                                </div>
                                <div class=\"form-group\">
                                    <label for=\"nome\">Nome Completo:</label>
                                    <input id=\"nome\" class=\"form-control\" type=\"text\" name=\"nome\"
                                        placeholder=\"Nome Completo\" minlength=\"2\" 
                                        style=\"text-transform:uppercase\" required=\"required\" value=\"$pesti->nome\">
                                </div>

                                <div class=\"form-group\">
                                    <label for=\"nomeguerra\">Nome de Guerra:</label>
                                    <input id=\"nomeguerra\" class=\"form-control\" type=\"text\" name=\"nomeguerra\"
                                        placeholder=\"Nome de Guerra\" minlength=\"2\"
                                        style=\"text-transform:uppercase\" required=\"required\" value=\"$pesti->nome_guerra\">
                                </div>
                                <div class=\"form-group\">
                                    <label for=\"nip\">NIP:</label>
                                    <input id=\"nip\" class=\"form-control\" type=\"text\" name=\"nip\" readonly=\"true\"
                                        placeholder=\"NIP\" maxlength=\"8\" required=\"required\" value=\"$pesti->nip\">
                                </div>

                                <div class=\"form-group\">
                                    <label for=\"cpf\">CPF (Servidores Civis):</label>
                                    <input id=\"cpf\" class=\"form-control\" type=\"text\" name=\"cpf\" readonly=\"true\"
                                        placeholder=\"CPF (Servidores Civis)\" maxlength=\"11\" value=\"$pesti->cpf\">
                                </div>

                                <div class=\"form-group\">
                                    <label for=\"correio_eletronico\">Correio Eletrônico:</label>
                                    <input id=\"correio_eletronico\" class=\"form-control\" type=\"email\" 
                                        name=\"correio_eletronico\" placeholder=\"Preferencialmente Zimbra\" 
                                        value=\"$pesti->correio_eletronico\" required=\"true\">
                                    <div class=\"help-block with-errors\"></div>
                                </div>

                                <div class=\"form-group\">
                                    <label for=\"funcao\">Função de TI:</label>
                                    <input id=\"funcao\" class=\"form-control\" type=\"text\" name=\"correfuncaoio_eletronico\" 
                                        placeholder=\"ex. Suporte ao usuário\" value=\"$pesti->funcao\" required=\"true\">
                                </div>

                                <div class=\"form-group\">
                                    <label for=\"ativo\" class=\"control-label\">Situação:</label>
                                    <select id=\"ativo\" class=\"form-control\" name=\"ativo\">
                                        <option value=\"$pesti->status\" selected=\"true\">$pesti->status</option>
                                        <option value=\"ATIVO\">ATIVO</option>
                                        <option value=\"INATIVO\">INATIVO</option>
                                    <div class=\"help-block with-errors\"></div>
                                </div>";
                            }
                            else{
                            echo"
                            <legend>Pessoal de TI - Cadastro</legend>
                            <div class=\"form-group\">
                                <label for=\"omapoiada\">OM Apoiada:</label>
                                <select id=\"omapoiada\" class=\"form-control\" name=\"omapoiada\">
                                    <option value=\"$admin_idom\" selected=\"true\">$admin_siglaom</option>";
                                    foreach ($omapoiada as $key => $value) {
                                        echo"<option value=\"".$value->idtb_om_apoiadas."\">
                                            ".$value->sigla."</option>";
                                    };
                                echo "</select>
                            </div>

                            <div class=\"form-group\">
                                <label for=\"postograd\">Posto/Graduação:</label>
                                <select id=\"postograd\" class=\"form-control\" name=\"postograd\">
                                    <option value=\"$pesti_posto_grad->idtb_posto_grad\" selected=\"true\">
                                        $pesti_posto_grad->sigla</option>";
                                    foreach ($postograd as $key => $value) {
                                        echo"<option value=\"".$value->idtb_posto_grad."\">
                                            ".$value->nome."</option>";
                                    };
                                echo "</select>
                            </div>

                            <div class=\"form-group\">
                                <label for=\"corpoquadro\">Corpo/Quadro:</label>
                                <select id=\"corpoquadro\" class=\"form-control\" name=\"corpoquadro\">
                                    <option value=\"$pesti_corpo_quadro->idtb_corpo_quadro\" selected=\"true\">
                                        $pesti_corpo_quadro->sigla</option>";
                                    foreach ($corpoquadro as $key => $value) {
                                        echo"<option value=\"".$value->idtb_corpo_quadro."\">
                                            ".$value->nome."</option>";
                                    };
                                echo "</select>
                            </div>

                            <div class=\"form-group\">
                                <label for=\"especialidade\">Especialidade:</label>
                                <select id=\"especialidade\" class=\"form-control\" name=\"especialidade\">
                                    <option value=\"$pesti_especialidade->idtb_especialidade\" selected=\"true\">
                                        $pesti_especialidade->sigla</option>";
                                    foreach ($especialidade as $key => $value) {
                                        echo"<option value=\"".$value->idtb_especialidade."\">
                                            ".$value->nome."</option>";
                                    };
                                echo "</select>
                            </div>
                            <div class=\"form-group\">
                                <label for=\"nome\">Nome Completo:</label>
                                <input id=\"nome\" class=\"form-control\" type=\"text\" name=\"nome\"
                                    placeholder=\"Nome Completo\" minlength=\"2\" 
                                    style=\"text-transform:uppercase\" required=\"required\" value=\"$pesti->nome\">
                            </div>

                            <div class=\"form-group\">
                                <label for=\"nomeguerra\">Nome de Guerra:</label>
                                <input id=\"nomeguerra\" class=\"form-control\" type=\"text\" name=\"nomeguerra\"
                                    placeholder=\"Nome de Guerra\" minlength=\"2\"
                                    style=\"text-transform:uppercase\" required=\"required\" value=\"$pesti->nome_guerra\">
                            </div>
                            <div class=\"form-group\">
                                <label for=\"nip\">NIP:</label>
                                <input id=\"nip\" class=\"form-control\" type=\"text\" name=\"nip\" 
                                       placeholder=\"NIP\" maxlength=\"8\" required=\"required\" value=\"$pesti->nip\">
                            </div>

                            <div class=\"form-group\">
                                <label for=\"cpf\">CPF (Servidores Civis):</label>
                                <input id=\"cpf\" class=\"form-control\" type=\"text\" name=\"cpf\" 
                                       placeholder=\"CPF (Servidores Civis)\" maxlength=\"11\" value=\"$pesti->cpf\">
                            </div>

                            <div class=\"form-group\">
                                <label for=\"correio_eletronico\">Correio Eletrônico:</label>
                                <input id=\"correio_eletronico\" class=\"form-control\" type=\"email\" 
                                    name=\"correio_eletronico\" placeholder=\"Preferencialmente Zimbra\" 
                                    value=\"$pesti->correio_eletronico\" required=\"true\">
                            </div>

                            <div class=\"form-group\">
                                <label for=\"funcao\">Função de TI:</label>
                                <input id=\"funcao\" class=\"form-control\" type=\"text\" name=\"funcao\" 
                                    placeholder=\"ex. Suporte ao usuário\" value=\"$pesti->funcao\" required=\"true\">
                            </div>

                            <input id=\"ativo\" type=\"hidden\" name=\"ativo\" value=\"ATIVO\">";
                            }
                        echo"
                        </fieldset>
                        <input id=\"idtb_pessoal_ti\" type=\"hidden\" name=\"idtb_pessoal_ti\" value=\"$pesti->idtb_pessoal_ti\">
                        <input class=\"btn btn-primary btn-block\" type=\"submit\" value=\"Salvar\">
                    </form>
                </div>
            </main>
        </div>
    </div>";
}

/* Monta quadro de administradores */
if (($row) AND ($act == NULL)) {

	$pesti = "SELECT * FROM db_clti.tb_pessoal_ti ORDER BY id_posto_grad DESC";
    $pesti = $pg->getRows($pesti);

    echo"<div class=\"table-responsive\">
            <table class=\"table table-hover\">
                <thead>
                    <tr>
                        <th scope=\"col\">Posto/Grad./Esp.</th>
                        <th scope=\"col\">NIP</th>
                        <th scope=\"col\">Nome</th>
                        <th scope=\"col\">Nome de Guerra</th>
                        <th scope=\"col\">Ações</th>
                    </tr>
                </thead>";

    foreach ($pesti as $key => $value) {

        #Seleciona Sigla do Posto/Graduação
        $postograd = $pg->getCol("SELECT sigla FROM db_clti.tb_posto_grad WHERE idtb_posto_grad = $value->id_posto_grad");
        
        #Selectiona Sigla do Corpo/Quadro
        if ($value->id_corpo_quadro != 11){
            $corpoquadro = $pg->getCol("SELECT sigla FROM db_clti.tb_corpo_quadro 
                WHERE idtb_corpo_quadro = $value->id_corpo_quadro");
        }
        else{
            $corpoquadro = "";
        }
        
        #Seleciona Sigla da Especialidade
        if ($value->id_especialidade != 12 AND $value->id_especialidade != 13) {
            $especialidade = $pg->getCol("SELECT sigla FROM db_clti.tb_especialidade 
                WHERE idtb_especialidade = $value->id_especialidade");
        }
        else{
            $especialidade = "";
        }

        #Seleciona NIP caso seja militar da MB
        if ($value->nip != NULL) {
            $identificacao = $value->nip;
        }
        else{
            $identificacao = "";
        }

        echo"       <tr>
                        <th scope=\"row\">".$postograd." ".$corpoquadro." ".$especialidade."</th>
                        <td>".$identificacao."</td>
                        <td>".$value->nome."</td>
                        <td>".$value->nome_guerra."</td>
                        <td><a href=\"?cmd=pessoalti&act=cad&param=".$value->idtb_pessoal_ti."\">Editar</a> - 
                            Excluir</td>
                    </tr>";
    }
    echo"
                </tbody>
            </table>
            </div>";
}

/* Método INSERT */
if ($act == 'insert') {
    $idtb_pessoal_ti = $_POST['idtb_pessoal_ti'];
	$omapoiada = $_POST['omapoiada'];
    $postograd = $_POST['postograd'];
    $corpoquadro = $_POST['corpoquadro'];
    $especialidade = $_POST['especialidade'];
    $nip = $_POST['nip'];
    $cpf = $_POST['cpf'];
    $nome = strtoupper($_POST['nome']);
    $nomeguerra = strtoupper($_POST['nomeguerra']);
    $correio_eletronico = strtolower($_POST['correio_eletronico']);
    $funcao = strtoupper($_POST['funcao']);
    $ativo = strtoupper($_POST['ativo']);

    if ($nip == NULL) {
        $usuario = $cpf;
    }
    else {
        $usuario = $nip;
    }

    /* Opta pelo Método Update */
    if ($idtb_pessoal_ti){

        $sql = "UPDATE db_clti.tb_pessoal_ti SET
            idtb_om_apoiada='$omapoiada',idtb_posto_grad='$postograd', idtb_corpo_quadro='$corpoquadro', 
            idtb_especialidade='$especialidade', nip='$nip', cpf='$cpf', nome='$nome', 
            nome_guerra='$nomeguerra', correio_eletronico='$correio_eletronico', 
            funcao='$funcao', situacao='$ativo'
            WHERE idtb_admin='$idtb_admin'";

        $pg->exec($sql);

        if ($pg) {
            echo "<h5>Resgistros incluídos no banco de dados.</h5>
            <meta http-equiv=\"refresh\" content=\"1;url=?cmd=pessoalti\">";
        }

        else {
            echo "<h5>Ocorreu algum erro, tente novamente.</h5>";
            echo(pg_result_error($pg) . "<br />\n");
        }
    }

    /* Opta pelo Método Insert */
    else{

        /* Checa se há Admin com mesmo login cadastrado */

        $sql = "SELECT * FROM db_clti.tb_pessoal_ti WHERE nip = '$usuario' OR cpf = '$usuario' ";
        $row = $pg->getRow($sql);

        if ($row) {
            echo "<h5>Já existe um Técnico cadastrado com esse NIP/CPF.</h5>";
        }

        else {

            $sql = "INSERT INTO db_clti.tb_pessoal_ti(
                idtb_om_apoiada,idtb_posto_grad, idtb_corpo_quadro, idtb_especialidade, 
                nip, cpf, nome, nome_guerra, correio_eletronico, funcao, situacao)
                VALUES ('$omapoiada', '$postograd', '$corpoquadro', '$especialidade',
                '$nip', '$cpf', '$nome', '$nomeguerra', '$funcao', '$correio_eletronico', 'ATIVO')";

            $pg->exec($sql);

            if ($pg) {
                echo "<h5>Resgistros incluídos no banco de dados.</h5>
                <meta http-equiv=\"refresh\" content=\"1;url=?cmd=pessoalti\">";
            }

            else {
                echo "<h5>Ocorreu algum erro, tente novamente.</h5>";
                echo(pg_result_error($pg) . "<br />\n");
            }

        }
    }
}

?>