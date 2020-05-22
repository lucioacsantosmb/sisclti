--
-- PostgreSQL database dump
--

-- Dumped from database version 10.13 (Ubuntu 10.13-1.pgdg18.04+1)
-- Dumped by pg_dump version 10.13 (Ubuntu 10.13-1.pgdg18.04+1)

-- Started on 2020-05-22 12:40:52 -03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3134 (class 1262 OID 16594)
-- Name: db_clti; Type: DATABASE; Schema: -; Owner: sisclti
--

CREATE DATABASE db_clti WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'pt_BR.UTF-8' LC_CTYPE = 'pt_BR.UTF-8';


ALTER DATABASE db_clti OWNER TO sisclti;

\connect db_clti

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 16595)
-- Name: db_clti; Type: SCHEMA; Schema: -; Owner: sisclti
--

CREATE SCHEMA db_clti;


ALTER SCHEMA db_clti OWNER TO sisclti;

--
-- TOC entry 1 (class 3079 OID 13009)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3136 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 197 (class 1259 OID 16596)
-- Name: cidade_id_sequence; Type: SEQUENCE; Schema: db_clti; Owner: postgres
--

CREATE SEQUENCE db_clti.cidade_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE db_clti.cidade_id_sequence OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16598)
-- Name: estado_id_sequence; Type: SEQUENCE; Schema: db_clti; Owner: postgres
--

CREATE SEQUENCE db_clti.estado_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE db_clti.estado_id_sequence OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16600)
-- Name: pais_id_sequence; Type: SEQUENCE; Schema: db_clti; Owner: postgres
--

CREATE SEQUENCE db_clti.pais_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE db_clti.pais_id_sequence OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16602)
-- Name: tb_admin_idtb_admin_sequence; Type: SEQUENCE; Schema: db_clti; Owner: postgres
--

CREATE SEQUENCE db_clti.tb_admin_idtb_admin_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE db_clti.tb_admin_idtb_admin_sequence OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 201 (class 1259 OID 16604)
-- Name: tb_admin; Type: TABLE; Schema: db_clti; Owner: postgres
--

CREATE TABLE db_clti.tb_admin (
    idtb_admin integer DEFAULT nextval('db_clti.tb_admin_idtb_admin_sequence'::regclass) NOT NULL,
    id_om integer,
    id_posto_grad integer,
    id_corpo_quadro integer,
    id_especialidade integer,
    nip character varying(8),
    cpf character varying(11),
    nome character varying(255),
    nome_guerra character varying(45),
    perfil character varying(45),
    senha character(255) NOT NULL,
    status character(45) NOT NULL
);


ALTER TABLE db_clti.tb_admin OWNER TO postgres;

--
-- TOC entry 3137 (class 0 OID 0)
-- Dependencies: 201
-- Name: TABLE tb_admin; Type: COMMENT; Schema: db_clti; Owner: postgres
--

COMMENT ON TABLE db_clti.tb_admin IS 'Tabela contendo os administradores de redes locais das OM.';


--
-- TOC entry 202 (class 1259 OID 16619)
-- Name: tb_cidade; Type: TABLE; Schema: db_clti; Owner: postgres
--

CREATE TABLE db_clti.tb_cidade (
    id integer DEFAULT nextval('db_clti.cidade_id_sequence'::regclass) NOT NULL,
    nome character varying(120) NOT NULL,
    estado integer NOT NULL
);


ALTER TABLE db_clti.tb_cidade OWNER TO postgres;

--
-- TOC entry 3139 (class 0 OID 0)
-- Dependencies: 202
-- Name: TABLE tb_cidade; Type: COMMENT; Schema: db_clti; Owner: postgres
--

COMMENT ON TABLE db_clti.tb_cidade IS 'Tabela contendo as cidades.';


--
-- TOC entry 203 (class 1259 OID 16623)
-- Name: tb_clti_idtb_clti_sequence; Type: SEQUENCE; Schema: db_clti; Owner: postgres
--

CREATE SEQUENCE db_clti.tb_clti_idtb_clti_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE db_clti.tb_clti_idtb_clti_sequence OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16625)
-- Name: tb_clti; Type: TABLE; Schema: db_clti; Owner: postgres
--

CREATE TABLE db_clti.tb_clti (
    idtb_clti integer DEFAULT nextval('db_clti.tb_clti_idtb_clti_sequence'::regclass) NOT NULL,
    idtipos_clti integer NOT NULL,
    efetivo_oficiais integer NOT NULL,
    efetivo_pracas integer NOT NULL,
    nome character varying(255) NOT NULL,
    sigla character varying(45) NOT NULL,
    indicativo character varying(6) NOT NULL,
    data_ativacao date NOT NULL
);


ALTER TABLE db_clti.tb_clti OWNER TO postgres;

--
-- TOC entry 3141 (class 0 OID 0)
-- Dependencies: 204
-- Name: TABLE tb_clti; Type: COMMENT; Schema: db_clti; Owner: postgres
--

COMMENT ON TABLE db_clti.tb_clti IS 'Tabela contendo as informações do CLTI.';


--
-- TOC entry 235 (class 1259 OID 16991)
-- Name: tb_conectividade; Type: TABLE; Schema: db_clti; Owner: sisclti
--

CREATE TABLE db_clti.tb_conectividade (
    idtb_conectividade integer NOT NULL,
    idtb_om_apoiadas integer NOT NULL,
    fabricante character varying(255) NOT NULL,
    modelo character varying(255) NOT NULL,
    localizacao character varying(255) NOT NULL,
    end_ip character varying(255),
    data_aquisicao date NOT NULL,
    data_garantia date
);


ALTER TABLE db_clti.tb_conectividade OWNER TO sisclti;

--
-- TOC entry 234 (class 1259 OID 16989)
-- Name: tb_conectividade_idtb_conectividade_seq; Type: SEQUENCE; Schema: db_clti; Owner: sisclti
--

CREATE SEQUENCE db_clti.tb_conectividade_idtb_conectividade_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE db_clti.tb_conectividade_idtb_conectividade_seq OWNER TO sisclti;

--
-- TOC entry 3143 (class 0 OID 0)
-- Dependencies: 234
-- Name: tb_conectividade_idtb_conectividade_seq; Type: SEQUENCE OWNED BY; Schema: db_clti; Owner: sisclti
--

ALTER SEQUENCE db_clti.tb_conectividade_idtb_conectividade_seq OWNED BY db_clti.tb_conectividade.idtb_conectividade;


--
-- TOC entry 205 (class 1259 OID 16629)
-- Name: tb_config; Type: TABLE; Schema: db_clti; Owner: postgres
--

CREATE TABLE db_clti.tb_config (
    idtb_config integer NOT NULL,
    parametro character varying(255),
    valor character varying(255)
);


ALTER TABLE db_clti.tb_config OWNER TO postgres;

--
-- TOC entry 3144 (class 0 OID 0)
-- Dependencies: 205
-- Name: TABLE tb_config; Type: COMMENT; Schema: db_clti; Owner: postgres
--

COMMENT ON TABLE db_clti.tb_config IS 'Parâmetros de configuração utilizados pelo sistema.';


--
-- TOC entry 206 (class 1259 OID 16635)
-- Name: tb_config_idtb_config_seq; Type: SEQUENCE; Schema: db_clti; Owner: postgres
--

CREATE SEQUENCE db_clti.tb_config_idtb_config_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE db_clti.tb_config_idtb_config_seq OWNER TO postgres;

--
-- TOC entry 3146 (class 0 OID 0)
-- Dependencies: 206
-- Name: tb_config_idtb_config_seq; Type: SEQUENCE OWNED BY; Schema: db_clti; Owner: postgres
--

ALTER SEQUENCE db_clti.tb_config_idtb_config_seq OWNED BY db_clti.tb_config.idtb_config;


--
-- TOC entry 207 (class 1259 OID 16637)
-- Name: tb_corpo_quadro_idtb_corpo_quadro_sequence; Type: SEQUENCE; Schema: db_clti; Owner: postgres
--

CREATE SEQUENCE db_clti.tb_corpo_quadro_idtb_corpo_quadro_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE db_clti.tb_corpo_quadro_idtb_corpo_quadro_sequence OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16639)
-- Name: tb_corpo_quadro; Type: TABLE; Schema: db_clti; Owner: postgres
--

CREATE TABLE db_clti.tb_corpo_quadro (
    idtb_corpo_quadro integer DEFAULT nextval('db_clti.tb_corpo_quadro_idtb_corpo_quadro_sequence'::regclass) NOT NULL,
    nome character varying(45) NOT NULL,
    sigla character varying(45) NOT NULL
);


ALTER TABLE db_clti.tb_corpo_quadro OWNER TO postgres;

--
-- TOC entry 3147 (class 0 OID 0)
-- Dependencies: 208
-- Name: TABLE tb_corpo_quadro; Type: COMMENT; Schema: db_clti; Owner: postgres
--

COMMENT ON TABLE db_clti.tb_corpo_quadro IS 'Tabela contendo os corpos e quadros da MB.';


--
-- TOC entry 209 (class 1259 OID 16643)
-- Name: tb_especialidade_idtb_especialidade_sequence; Type: SEQUENCE; Schema: db_clti; Owner: postgres
--

CREATE SEQUENCE db_clti.tb_especialidade_idtb_especialidade_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE db_clti.tb_especialidade_idtb_especialidade_sequence OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16645)
-- Name: tb_especialidade; Type: TABLE; Schema: db_clti; Owner: postgres
--

CREATE TABLE db_clti.tb_especialidade (
    idtb_especialidade integer DEFAULT nextval('db_clti.tb_especialidade_idtb_especialidade_sequence'::regclass) NOT NULL,
    nome character varying(45) NOT NULL,
    sigla character varying(45) NOT NULL
);


ALTER TABLE db_clti.tb_especialidade OWNER TO postgres;

--
-- TOC entry 3149 (class 0 OID 0)
-- Dependencies: 210
-- Name: TABLE tb_especialidade; Type: COMMENT; Schema: db_clti; Owner: postgres
--

COMMENT ON TABLE db_clti.tb_especialidade IS 'Tabela contendo as especialidades dos militares da MB.	';


--
-- TOC entry 229 (class 1259 OID 16885)
-- Name: tb_estacoes; Type: TABLE; Schema: db_clti; Owner: postgres
--

CREATE TABLE db_clti.tb_estacoes (
    idtb_estacoes integer NOT NULL,
    idtb_om_apoiadas integer NOT NULL,
    fabricante character varying(255) NOT NULL,
    modelo character varying(255) NOT NULL,
    processador character varying(255) NOT NULL,
    memoria character varying(255) NOT NULL,
    armazenamento character varying(255) NOT NULL,
    idtb_sor integer NOT NULL,
    end_ip character varying(255) NOT NULL,
    data_aquisicao date NOT NULL,
    data_garantia date NOT NULL,
    localizacao character varying(255) NOT NULL,
    req_minimos character varying(45) NOT NULL,
    situacao character varying(255)
);


ALTER TABLE db_clti.tb_estacoes OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16883)
-- Name: tb_estacoes_idtb_estacoes_seq; Type: SEQUENCE; Schema: db_clti; Owner: postgres
--

CREATE SEQUENCE db_clti.tb_estacoes_idtb_estacoes_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE db_clti.tb_estacoes_idtb_estacoes_seq OWNER TO postgres;

--
-- TOC entry 3152 (class 0 OID 0)
-- Dependencies: 228
-- Name: tb_estacoes_idtb_estacoes_seq; Type: SEQUENCE OWNED BY; Schema: db_clti; Owner: postgres
--

ALTER SEQUENCE db_clti.tb_estacoes_idtb_estacoes_seq OWNED BY db_clti.tb_estacoes.idtb_estacoes;


--
-- TOC entry 211 (class 1259 OID 16649)
-- Name: tb_estado; Type: TABLE; Schema: db_clti; Owner: postgres
--

CREATE TABLE db_clti.tb_estado (
    id integer DEFAULT nextval('db_clti.estado_id_sequence'::regclass) NOT NULL,
    nome character varying(75) NOT NULL,
    uf character varying(5) NOT NULL,
    pais integer NOT NULL
);


ALTER TABLE db_clti.tb_estado OWNER TO postgres;

--
-- TOC entry 3153 (class 0 OID 0)
-- Dependencies: 211
-- Name: TABLE tb_estado; Type: COMMENT; Schema: db_clti; Owner: postgres
--

COMMENT ON TABLE db_clti.tb_estado IS 'Tabela contendo os estados.';


--
-- TOC entry 212 (class 1259 OID 16653)
-- Name: tb_tripulacao_clti_idtripulacao_clti_sequence; Type: SEQUENCE; Schema: db_clti; Owner: postgres
--

CREATE SEQUENCE db_clti.tb_tripulacao_clti_idtripulacao_clti_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE db_clti.tb_tripulacao_clti_idtripulacao_clti_sequence OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16655)
-- Name: tb_lotacao_clti; Type: TABLE; Schema: db_clti; Owner: postgres
--

CREATE TABLE db_clti.tb_lotacao_clti (
    idtripulacao_clti integer DEFAULT nextval('db_clti.tb_tripulacao_clti_idtripulacao_clti_sequence'::regclass) NOT NULL,
    id_posto_grad integer NOT NULL,
    id_corpo_quadro integer,
    id_especialidade integer,
    nip character varying(8),
    cpf character varying(11) DEFAULT NULL::character varying,
    nome character varying(255) NOT NULL,
    nome_guerra character varying(45) NOT NULL,
    status character varying(45) DEFAULT '1'::character varying NOT NULL,
    senha character varying(255),
    perfil character varying(45)
);


ALTER TABLE db_clti.tb_lotacao_clti OWNER TO postgres;

--
-- TOC entry 3155 (class 0 OID 0)
-- Dependencies: 213
-- Name: TABLE tb_lotacao_clti; Type: COMMENT; Schema: db_clti; Owner: postgres
--

COMMENT ON TABLE db_clti.tb_lotacao_clti IS 'Tabela contendo os dados da equipe do CLTI.';


--
-- TOC entry 214 (class 1259 OID 16663)
-- Name: tb_om_apoiadas_idtb_om_apoiadas_sequence; Type: SEQUENCE; Schema: db_clti; Owner: postgres
--

CREATE SEQUENCE db_clti.tb_om_apoiadas_idtb_om_apoiadas_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE db_clti.tb_om_apoiadas_idtb_om_apoiadas_sequence OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16665)
-- Name: tb_om_apoiadas; Type: TABLE; Schema: db_clti; Owner: postgres
--

CREATE TABLE db_clti.tb_om_apoiadas (
    idtb_om_apoiadas integer DEFAULT nextval('db_clti.tb_om_apoiadas_idtb_om_apoiadas_sequence'::regclass) NOT NULL,
    cod_om integer NOT NULL,
    nome character varying(255) NOT NULL,
    sigla character varying(45) NOT NULL,
    indicativo character varying(6) NOT NULL,
    id_estado integer NOT NULL,
    id_cidade integer NOT NULL
);


ALTER TABLE db_clti.tb_om_apoiadas OWNER TO postgres;

--
-- TOC entry 3157 (class 0 OID 0)
-- Dependencies: 215
-- Name: TABLE tb_om_apoiadas; Type: COMMENT; Schema: db_clti; Owner: postgres
--

COMMENT ON TABLE db_clti.tb_om_apoiadas IS 'Tabela contendo os dados das OM apoiadas pelo CLTI.';


--
-- TOC entry 216 (class 1259 OID 16669)
-- Name: tb_osic_idtb_osic_sequence; Type: SEQUENCE; Schema: db_clti; Owner: postgres
--

CREATE SEQUENCE db_clti.tb_osic_idtb_osic_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE db_clti.tb_osic_idtb_osic_sequence OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16671)
-- Name: tb_osic; Type: TABLE; Schema: db_clti; Owner: postgres
--

CREATE TABLE db_clti.tb_osic (
    idtb_osic integer DEFAULT nextval('db_clti.tb_osic_idtb_osic_sequence'::regclass) NOT NULL,
    id_om integer,
    id_posto_grad integer,
    id_corpo_quadro integer,
    id_especialidade integer,
    nip character varying(8),
    cpf character varying(11),
    nome character varying(255),
    nome_guerra character varying(45),
    perfil character varying(45),
    senha character varying(255),
    status character varying(45)
);


ALTER TABLE db_clti.tb_osic OWNER TO postgres;

--
-- TOC entry 3159 (class 0 OID 0)
-- Dependencies: 217
-- Name: TABLE tb_osic; Type: COMMENT; Schema: db_clti; Owner: postgres
--

COMMENT ON TABLE db_clti.tb_osic IS 'Tabela contendo os OSIC das OM.';


--
-- TOC entry 218 (class 1259 OID 16675)
-- Name: tb_pais; Type: TABLE; Schema: db_clti; Owner: postgres
--

CREATE TABLE db_clti.tb_pais (
    id integer DEFAULT nextval('db_clti.pais_id_sequence'::regclass) NOT NULL,
    nome character varying(60) NOT NULL,
    sigla character varying(10) NOT NULL
);


ALTER TABLE db_clti.tb_pais OWNER TO postgres;

--
-- TOC entry 3161 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE tb_pais; Type: COMMENT; Schema: db_clti; Owner: postgres
--

COMMENT ON TABLE db_clti.tb_pais IS 'Tabela contendo países.';


--
-- TOC entry 231 (class 1259 OID 16906)
-- Name: tb_pessoal_ti; Type: TABLE; Schema: db_clti; Owner: postgres
--

CREATE TABLE db_clti.tb_pessoal_ti (
    idtb_pessoal_ti integer NOT NULL,
    idtb_om_apoiada integer NOT NULL,
    idtb_posto_grad integer NOT NULL,
    idtb_corpo_quadro integer NOT NULL,
    idtb_especialidade integer NOT NULL,
    nip character varying(8) NOT NULL,
    cpf character varying(11) NOT NULL,
    nome character varying(255) NOT NULL,
    nome_guerra character varying(255) NOT NULL,
    correio_eletronico character varying(255) NOT NULL,
    funcao character varying(255) NOT NULL,
    situacao character varying(255) NOT NULL
);


ALTER TABLE db_clti.tb_pessoal_ti OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16904)
-- Name: tb_pessoal_ti_idtb_pessoal_ti_seq; Type: SEQUENCE; Schema: db_clti; Owner: postgres
--

CREATE SEQUENCE db_clti.tb_pessoal_ti_idtb_pessoal_ti_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE db_clti.tb_pessoal_ti_idtb_pessoal_ti_seq OWNER TO postgres;

--
-- TOC entry 3164 (class 0 OID 0)
-- Dependencies: 230
-- Name: tb_pessoal_ti_idtb_pessoal_ti_seq; Type: SEQUENCE OWNED BY; Schema: db_clti; Owner: postgres
--

ALTER SEQUENCE db_clti.tb_pessoal_ti_idtb_pessoal_ti_seq OWNED BY db_clti.tb_pessoal_ti.idtb_pessoal_ti;


--
-- TOC entry 219 (class 1259 OID 16679)
-- Name: tb_posto_grad; Type: TABLE; Schema: db_clti; Owner: postgres
--

CREATE TABLE db_clti.tb_posto_grad (
    idtb_posto_grad integer NOT NULL,
    nome character varying(45) NOT NULL,
    sigla character varying(45) NOT NULL
);


ALTER TABLE db_clti.tb_posto_grad OWNER TO postgres;

--
-- TOC entry 3165 (class 0 OID 0)
-- Dependencies: 219
-- Name: TABLE tb_posto_grad; Type: COMMENT; Schema: db_clti; Owner: postgres
--

COMMENT ON TABLE db_clti.tb_posto_grad IS 'Tabela contendo os postos e graduações da MB.';


--
-- TOC entry 220 (class 1259 OID 16682)
-- Name: tb_posto_grad_idtb_posto_grad_seq; Type: SEQUENCE; Schema: db_clti; Owner: postgres
--

CREATE SEQUENCE db_clti.tb_posto_grad_idtb_posto_grad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE db_clti.tb_posto_grad_idtb_posto_grad_seq OWNER TO postgres;

--
-- TOC entry 3167 (class 0 OID 0)
-- Dependencies: 220
-- Name: tb_posto_grad_idtb_posto_grad_seq; Type: SEQUENCE OWNED BY; Schema: db_clti; Owner: postgres
--

ALTER SEQUENCE db_clti.tb_posto_grad_idtb_posto_grad_seq OWNED BY db_clti.tb_posto_grad.idtb_posto_grad;


--
-- TOC entry 221 (class 1259 OID 16684)
-- Name: tb_posto_grad_idtb_posto_grad_sequence; Type: SEQUENCE; Schema: db_clti; Owner: postgres
--

CREATE SEQUENCE db_clti.tb_posto_grad_idtb_posto_grad_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE db_clti.tb_posto_grad_idtb_posto_grad_sequence OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16937)
-- Name: tb_qualificacao_ti; Type: TABLE; Schema: db_clti; Owner: postgres
--

CREATE TABLE db_clti.tb_qualificacao_ti (
    idtb_qualificacao_ti integer NOT NULL,
    idtb_pessoal_ti integer NOT NULL,
    nome_curso character varying(255) NOT NULL,
    instituicao character varying(255) NOT NULL,
    data_conclusao date NOT NULL,
    carga_horaria integer NOT NULL,
    tipo character varying(255) NOT NULL,
    custo integer NOT NULL,
    meio character varying(255) NOT NULL
);


ALTER TABLE db_clti.tb_qualificacao_ti OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16935)
-- Name: tb_qualificacao_ti_idtb_qualificacao_ti_seq; Type: SEQUENCE; Schema: db_clti; Owner: postgres
--

CREATE SEQUENCE db_clti.tb_qualificacao_ti_idtb_qualificacao_ti_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE db_clti.tb_qualificacao_ti_idtb_qualificacao_ti_seq OWNER TO postgres;

--
-- TOC entry 3169 (class 0 OID 0)
-- Dependencies: 232
-- Name: tb_qualificacao_ti_idtb_qualificacao_ti_seq; Type: SEQUENCE OWNED BY; Schema: db_clti; Owner: postgres
--

ALTER SEQUENCE db_clti.tb_qualificacao_ti_idtb_qualificacao_ti_seq OWNED BY db_clti.tb_qualificacao_ti.idtb_qualificacao_ti;


--
-- TOC entry 227 (class 1259 OID 16864)
-- Name: tb_servidores; Type: TABLE; Schema: db_clti; Owner: sisclti
--

CREATE TABLE db_clti.tb_servidores (
    idtb_servidores integer NOT NULL,
    idtb_om_apoiadas integer NOT NULL,
    modelo character varying(255) NOT NULL,
    processador character varying(255) NOT NULL,
    memoria character varying(255) NOT NULL,
    armazenamento character varying(255) NOT NULL,
    rede character varying(255) NOT NULL,
    idtb_sor integer NOT NULL,
    end_ip character varying(255) NOT NULL,
    finalidade character varying(255) NOT NULL,
    data_aquisicao date NOT NULL,
    data_garantia date,
    fabricante character varying(255) NOT NULL,
    localizacao character varying(255)
);


ALTER TABLE db_clti.tb_servidores OWNER TO sisclti;

--
-- TOC entry 226 (class 1259 OID 16862)
-- Name: tb_servidores_idtb_servidores_seq; Type: SEQUENCE; Schema: db_clti; Owner: sisclti
--

CREATE SEQUENCE db_clti.tb_servidores_idtb_servidores_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE db_clti.tb_servidores_idtb_servidores_seq OWNER TO sisclti;

--
-- TOC entry 3170 (class 0 OID 0)
-- Dependencies: 226
-- Name: tb_servidores_idtb_servidores_seq; Type: SEQUENCE OWNED BY; Schema: db_clti; Owner: sisclti
--

ALTER SEQUENCE db_clti.tb_servidores_idtb_servidores_seq OWNED BY db_clti.tb_servidores.idtb_servidores;


--
-- TOC entry 225 (class 1259 OID 16811)
-- Name: tb_sor; Type: TABLE; Schema: db_clti; Owner: sisclti
--

CREATE TABLE db_clti.tb_sor (
    idtb_sor integer NOT NULL,
    desenvolvedor character varying(512) NOT NULL,
    descricao character varying(255),
    versao character varying(45),
    situacao character varying(45)
);


ALTER TABLE db_clti.tb_sor OWNER TO sisclti;

--
-- TOC entry 224 (class 1259 OID 16809)
-- Name: tb_sor_idtb_sor_seq; Type: SEQUENCE; Schema: db_clti; Owner: sisclti
--

CREATE SEQUENCE db_clti.tb_sor_idtb_sor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE db_clti.tb_sor_idtb_sor_seq OWNER TO sisclti;

--
-- TOC entry 3171 (class 0 OID 0)
-- Dependencies: 224
-- Name: tb_sor_idtb_sor_seq; Type: SEQUENCE OWNED BY; Schema: db_clti; Owner: sisclti
--

ALTER SEQUENCE db_clti.tb_sor_idtb_sor_seq OWNED BY db_clti.tb_sor.idtb_sor;


--
-- TOC entry 222 (class 1259 OID 16686)
-- Name: tb_tipos_clti_idtipos_clti_sequence; Type: SEQUENCE; Schema: db_clti; Owner: postgres
--

CREATE SEQUENCE db_clti.tb_tipos_clti_idtipos_clti_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE db_clti.tb_tipos_clti_idtipos_clti_sequence OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16688)
-- Name: tb_tipos_clti; Type: TABLE; Schema: db_clti; Owner: postgres
--

CREATE TABLE db_clti.tb_tipos_clti (
    idtipos_clti integer DEFAULT nextval('db_clti.tb_tipos_clti_idtipos_clti_sequence'::regclass) NOT NULL,
    norma_atual character varying(45) NOT NULL,
    data_norma date NOT NULL,
    lotacao_oficiais smallint NOT NULL,
    lotacao_pracas smallint NOT NULL,
    tipo_clti character varying(45) NOT NULL
);


ALTER TABLE db_clti.tb_tipos_clti OWNER TO postgres;

--
-- TOC entry 3172 (class 0 OID 0)
-- Dependencies: 223
-- Name: TABLE tb_tipos_clti; Type: COMMENT; Schema: db_clti; Owner: postgres
--

COMMENT ON TABLE db_clti.tb_tipos_clti IS 'Tabela contendo os tipos de CLTI.';


--
-- TOC entry 2895 (class 2604 OID 16994)
-- Name: tb_conectividade idtb_conectividade; Type: DEFAULT; Schema: db_clti; Owner: sisclti
--

ALTER TABLE ONLY db_clti.tb_conectividade ALTER COLUMN idtb_conectividade SET DEFAULT nextval('db_clti.tb_conectividade_idtb_conectividade_seq'::regclass);


--
-- TOC entry 2878 (class 2604 OID 16693)
-- Name: tb_config idtb_config; Type: DEFAULT; Schema: db_clti; Owner: postgres
--

ALTER TABLE ONLY db_clti.tb_config ALTER COLUMN idtb_config SET DEFAULT nextval('db_clti.tb_config_idtb_config_seq'::regclass);


--
-- TOC entry 2892 (class 2604 OID 16888)
-- Name: tb_estacoes idtb_estacoes; Type: DEFAULT; Schema: db_clti; Owner: postgres
--

ALTER TABLE ONLY db_clti.tb_estacoes ALTER COLUMN idtb_estacoes SET DEFAULT nextval('db_clti.tb_estacoes_idtb_estacoes_seq'::regclass);


--
-- TOC entry 2893 (class 2604 OID 16909)
-- Name: tb_pessoal_ti idtb_pessoal_ti; Type: DEFAULT; Schema: db_clti; Owner: postgres
--

ALTER TABLE ONLY db_clti.tb_pessoal_ti ALTER COLUMN idtb_pessoal_ti SET DEFAULT nextval('db_clti.tb_pessoal_ti_idtb_pessoal_ti_seq'::regclass);


--
-- TOC entry 2888 (class 2604 OID 16694)
-- Name: tb_posto_grad idtb_posto_grad; Type: DEFAULT; Schema: db_clti; Owner: postgres
--

ALTER TABLE ONLY db_clti.tb_posto_grad ALTER COLUMN idtb_posto_grad SET DEFAULT nextval('db_clti.tb_posto_grad_idtb_posto_grad_seq'::regclass);


--
-- TOC entry 2894 (class 2604 OID 16940)
-- Name: tb_qualificacao_ti idtb_qualificacao_ti; Type: DEFAULT; Schema: db_clti; Owner: postgres
--

ALTER TABLE ONLY db_clti.tb_qualificacao_ti ALTER COLUMN idtb_qualificacao_ti SET DEFAULT nextval('db_clti.tb_qualificacao_ti_idtb_qualificacao_ti_seq'::regclass);


--
-- TOC entry 2891 (class 2604 OID 16867)
-- Name: tb_servidores idtb_servidores; Type: DEFAULT; Schema: db_clti; Owner: sisclti
--

ALTER TABLE ONLY db_clti.tb_servidores ALTER COLUMN idtb_servidores SET DEFAULT nextval('db_clti.tb_servidores_idtb_servidores_seq'::regclass);


--
-- TOC entry 2890 (class 2604 OID 16814)
-- Name: tb_sor idtb_sor; Type: DEFAULT; Schema: db_clti; Owner: sisclti
--

ALTER TABLE ONLY db_clti.tb_sor ALTER COLUMN idtb_sor SET DEFAULT nextval('db_clti.tb_sor_idtb_sor_seq'::regclass);


--
-- TOC entry 3094 (class 0 OID 16604)
-- Dependencies: 201
-- Data for Name: tb_admin; Type: TABLE DATA; Schema: db_clti; Owner: postgres
--

COPY db_clti.tb_admin (idtb_admin, id_om, id_posto_grad, id_corpo_quadro, id_especialidade, nip, cpf, nome, nome_guerra, perfil, senha, status) FROM stdin;
3	5	16	1	8	99242991		LúCIO ALEXANDRE CORREIA DOS SANTOS	ALEXANDRE	ADMIN_OM	c4ce9a5fa42b7026826369e2e6faa9d3b15f0394e56d37e55c58dd2c5e4001594a9ca4efe19e6ac6                                                                                                                                                                               	ATIVO                                        
\.


--
-- TOC entry 3095 (class 0 OID 16619)
-- Dependencies: 202
-- Data for Name: tb_cidade; Type: TABLE DATA; Schema: db_clti; Owner: postgres
--

COPY db_clti.tb_cidade (id, nome, estado) FROM stdin;
1	Afonso Cláudio	8
2	Água Doce do Norte	8
3	Águia Branca	8
4	Alegre	8
5	Alfredo Chaves	8
6	Alto Rio Novo	8
7	Anchieta	8
8	Apiacá	8
9	Aracruz	8
10	Atilio Vivacqua	8
11	Baixo Guandu	8
12	Barra de São Francisco	8
13	Boa Esperança	8
14	Bom Jesus do Norte	8
15	Brejetuba	8
16	Cachoeiro de Itapemirim	8
17	Cariacica	8
18	Castelo	8
19	Colatina	8
20	Conceição da Barra	8
21	Conceição do Castelo	8
22	Divino de São Lourenço	8
23	Domingos Martins	8
24	Dores do Rio Preto	8
25	Ecoporanga	8
26	Fundão	8
27	Governador Lindenberg	8
28	Guaçuí	8
29	Guarapari	8
30	Ibatiba	8
31	Ibiraçu	8
32	Ibitirama	8
33	Iconha	8
34	Irupi	8
35	Itaguaçu	8
36	Itapemirim	8
37	Itarana	8
38	Iúna	8
39	Jaguaré	8
40	Jerônimo Monteiro	8
41	João Neiva	8
42	Laranja da Terra	8
43	Linhares	8
44	Mantenópolis	8
45	Marataízes	8
46	Marechal Floriano	8
47	Marilândia	8
48	Mimoso do Sul	8
49	Montanha	8
50	Mucurici	8
51	Muniz Freire	8
52	Muqui	8
53	Nova Venécia	8
54	Pancas	8
55	Pedro Canário	8
56	Pinheiros	8
57	Piúma	8
58	Ponto Belo	8
59	Presidente Kennedy	8
60	Rio Bananal	8
61	Rio Novo do Sul	8
62	Santa Leopoldina	8
63	Santa Maria de Jetibá	8
64	Santa Teresa	8
65	São Domingos do Norte	8
66	São Gabriel da Palha	8
67	São José do Calçado	8
68	São Mateus	8
69	São Roque do Canaã	8
70	Serra	8
71	Sooretama	8
72	Vargem Alta	8
73	Venda Nova do Imigrante	8
74	Viana	8
75	Vila Pavão	8
76	Vila Valério	8
77	Vila Velha	8
78	Vitória	8
79	Acrelândia	1
80	Assis Brasil	1
81	Brasiléia	1
82	Bujari	1
83	Capixaba	1
84	Cruzeiro do Sul	1
85	Epitaciolândia	1
86	Feijó	1
87	Jordão	1
88	Mâncio Lima	1
89	Manoel Urbano	1
90	Marechal Thaumaturgo	1
91	Plácido de Castro	1
92	Porto Acre	1
93	Porto Walter	1
94	Rio Branco	1
95	Rodrigues Alves	1
96	Santa Rosa do Purus	1
97	Sena Madureira	1
98	Senador Guiomard	1
99	Tarauacá	1
100	Xapuri	1
101	Água Branca	2
102	Anadia	2
103	Arapiraca	2
104	Atalaia	2
105	Barra de Santo Antônio	2
106	Barra de São Miguel	2
107	Batalha	2
108	Belém	2
109	Belo Monte	2
110	Boca da Mata	2
111	Branquinha	2
112	Cacimbinhas	2
113	Cajueiro	2
114	Campestre	2
115	Campo Alegre	2
116	Campo Grande	2
117	Canapi	2
118	Capela	2
119	Carneiros	2
120	Chã Preta	2
121	Coité do Nóia	2
122	Colônia Leopoldina	2
123	Coqueiro Seco	2
124	Coruripe	2
125	Craíbas	2
126	Delmiro Gouveia	2
127	Dois Riachos	2
128	Estrela de Alagoas	2
129	Feira Grande	2
130	Feliz Deserto	2
131	Flexeiras	2
132	Girau do Ponciano	2
133	Ibateguara	2
134	Igaci	2
135	Igreja Nova	2
136	Inhapi	2
137	Jacaré dos Homens	2
138	Jacuípe	2
139	Japaratinga	2
140	Jaramataia	2
141	Jequiá da Praia	2
142	Joaquim Gomes	2
143	Jundiá	2
144	Junqueiro	2
145	Lagoa da Canoa	2
146	Limoeiro de Anadia	2
147	Maceió	2
148	Major Isidoro	2
149	Mar Vermelho	2
150	Maragogi	2
151	Maravilha	2
152	Marechal Deodoro	2
153	Maribondo	2
154	Mata Grande	2
155	Matriz de Camaragibe	2
156	Messias	2
157	Minador do Negrão	2
158	Monteirópolis	2
159	Murici	2
160	Novo Lino	2
161	Olho d"Água das Flores	2
162	Olho d"Água do Casado	2
163	Olho d"Água Grande	2
164	Olivença	2
165	Ouro Branco	2
166	Palestina	2
167	Palmeira dos Índios	2
168	Pão de Açúcar	2
169	Pariconha	2
170	Paripueira	2
171	Passo de Camaragibe	2
172	Paulo Jacinto	2
173	Penedo	2
174	Piaçabuçu	2
175	Pilar	2
176	Pindoba	2
177	Piranhas	2
178	Poço das Trincheiras	2
179	Porto Calvo	2
180	Porto de Pedras	2
181	Porto Real do Colégio	2
182	Quebrangulo	2
183	Rio Largo	2
184	Roteiro	2
185	Santa Luzia do Norte	2
186	Santana do Ipanema	2
187	Santana do Mundaú	2
188	São Brás	2
189	São José da Laje	2
190	São José da Tapera	2
191	São Luís do Quitunde	2
192	São Miguel dos Campos	2
193	São Miguel dos Milagres	2
194	São Sebastião	2
195	Satuba	2
196	Senador Rui Palmeira	2
197	Tanque d"Arca	2
198	Taquarana	2
199	Teotônio Vilela	2
200	Traipu	2
201	União dos Palmares	2
202	Viçosa	2
203	Amapá	4
204	Calçoene	4
205	Cutias	4
206	Ferreira Gomes	4
207	Itaubal	4
208	Laranjal do Jari	4
209	Macapá	4
210	Mazagão	4
211	Oiapoque	4
212	Pedra Branca do Amaparí	4
213	Porto Grande	4
214	Pracuúba	4
215	Santana	4
216	Serra do Navio	4
217	Tartarugalzinho	4
218	Vitória do Jari	4
219	Alvarães	3
220	Amaturá	3
221	Anamã	3
222	Anori	3
223	Apuí	3
224	Atalaia do Norte	3
225	Autazes	3
226	Barcelos	3
227	Barreirinha	3
228	Benjamin Constant	3
229	Beruri	3
230	Boa Vista do Ramos	3
231	Boca do Acre	3
232	Borba	3
233	Caapiranga	3
234	Canutama	3
235	Carauari	3
236	Careiro	3
237	Careiro da Várzea	3
238	Coari	3
239	Codajás	3
240	Eirunepé	3
241	Envira	3
242	Fonte Boa	3
243	Guajará	3
244	Humaitá	3
245	Ipixuna	3
246	Iranduba	3
247	Itacoatiara	3
248	Itamarati	3
249	Itapiranga	3
250	Japurá	3
251	Juruá	3
252	Jutaí	3
253	Lábrea	3
254	Manacapuru	3
255	Manaquiri	3
256	Manaus	3
257	Manicoré	3
258	Maraã	3
259	Maués	3
260	Nhamundá	3
261	Nova Olinda do Norte	3
262	Novo Airão	3
263	Novo Aripuanã	3
264	Parintins	3
265	Pauini	3
266	Presidente Figueiredo	3
267	Rio Preto da Eva	3
268	Santa Isabel do Rio Negro	3
269	Santo Antônio do Içá	3
270	São Gabriel da Cachoeira	3
271	São Paulo de Olivença	3
272	São Sebastião do Uatumã	3
273	Silves	3
274	Tabatinga	3
275	Tapauá	3
276	Tefé	3
277	Tonantins	3
278	Uarini	3
279	Urucará	3
280	Urucurituba	3
281	Abaíra	5
282	Abaré	5
283	Acajutiba	5
284	Adustina	5
285	Água Fria	5
286	Aiquara	5
287	Alagoinhas	5
288	Alcobaça	5
289	Almadina	5
290	Amargosa	5
291	Amélia Rodrigues	5
292	América Dourada	5
293	Anagé	5
294	Andaraí	5
295	Andorinha	5
296	Angical	5
297	Anguera	5
298	Antas	5
299	Antônio Cardoso	5
300	Antônio Gonçalves	5
301	Aporá	5
302	Apuarema	5
303	Araças	5
304	Aracatu	5
305	Araci	5
306	Aramari	5
307	Arataca	5
308	Aratuípe	5
309	Aurelino Leal	5
310	Baianópolis	5
311	Baixa Grande	5
312	Banzaê	5
313	Barra	5
314	Barra da Estiva	5
315	Barra do Choça	5
316	Barra do Mendes	5
317	Barra do Rocha	5
318	Barreiras	5
319	Barro Alto	5
320	Barro Preto (antigo Gov. Lomanto Jr.)	5
321	Barrocas	5
322	Belmonte	5
323	Belo Campo	5
324	Biritinga	5
325	Boa Nova	5
326	Boa Vista do Tupim	5
327	Bom Jesus da Lapa	5
328	Bom Jesus da Serra	5
329	Boninal	5
330	Bonito	5
331	Boquira	5
332	Botuporã	5
333	Brejões	5
334	Brejolândia	5
335	Brotas de Macaúbas	5
336	Brumado	5
337	Buerarema	5
338	Buritirama	5
339	Caatiba	5
340	Cabaceiras do Paraguaçu	5
341	Cachoeira	5
342	Caculé	5
343	Caém	5
344	Caetanos	5
345	Caetité	5
346	Cafarnaum	5
347	Cairu	5
348	Caldeirão Grande	5
349	Camacan	5
350	Camaçari	5
351	Camamu	5
352	Campo Alegre de Lourdes	5
353	Campo Formoso	5
354	Canápolis	5
355	Canarana	5
356	Canavieiras	5
357	Candeal	5
358	Candeias	5
359	Candiba	5
360	Cândido Sales	5
361	Cansanção	5
362	Canudos	5
363	Capela do Alto Alegre	5
364	Capim Grosso	5
365	Caraíbas	5
366	Caravelas	5
367	Cardeal da Silva	5
368	Carinhanha	5
369	Casa Nova	5
370	Castro Alves	5
371	Catolândia	5
372	Catu	5
373	Caturama	5
374	Central	5
375	Chorrochó	5
376	Cícero Dantas	5
377	Cipó	5
378	Coaraci	5
379	Cocos	5
380	Conceição da Feira	5
381	Conceição do Almeida	5
382	Conceição do Coité	5
383	Conceição do Jacuípe	5
384	Conde	5
385	Condeúba	5
386	Contendas do Sincorá	5
387	Coração de Maria	5
388	Cordeiros	5
389	Coribe	5
390	Coronel João Sá	5
391	Correntina	5
392	Cotegipe	5
393	Cravolândia	5
394	Crisópolis	5
395	Cristópolis	5
396	Cruz das Almas	5
397	Curaçá	5
398	Dário Meira	5
399	Dias d"Ávila	5
400	Dom Basílio	5
401	Dom Macedo Costa	5
402	Elísio Medrado	5
403	Encruzilhada	5
404	Entre Rios	5
405	Érico Cardoso	5
406	Esplanada	5
407	Euclides da Cunha	5
408	Eunápolis	5
409	Fátima	5
410	Feira da Mata	5
411	Feira de Santana	5
412	Filadélfia	5
413	Firmino Alves	5
414	Floresta Azul	5
415	Formosa do Rio Preto	5
416	Gandu	5
417	Gavião	5
418	Gentio do Ouro	5
419	Glória	5
420	Gongogi	5
421	Governador Mangabeira	5
422	Guajeru	5
423	Guanambi	5
424	Guaratinga	5
425	Heliópolis	5
426	Iaçu	5
427	Ibiassucê	5
428	Ibicaraí	5
429	Ibicoara	5
430	Ibicuí	5
431	Ibipeba	5
432	Ibipitanga	5
433	Ibiquera	5
434	Ibirapitanga	5
435	Ibirapuã	5
436	Ibirataia	5
437	Ibitiara	5
438	Ibititá	5
439	Ibotirama	5
440	Ichu	5
441	Igaporã	5
442	Igrapiúna	5
443	Iguaí	5
444	Ilhéus	5
445	Inhambupe	5
446	Ipecaetá	5
447	Ipiaú	5
448	Ipirá	5
449	Ipupiara	5
450	Irajuba	5
451	Iramaia	5
452	Iraquara	5
453	Irará	5
454	Irecê	5
455	Itabela	5
456	Itaberaba	5
457	Itabuna	5
458	Itacaré	5
459	Itaeté	5
460	Itagi	5
461	Itagibá	5
462	Itagimirim	5
463	Itaguaçu da Bahia	5
464	Itaju do Colônia	5
465	Itajuípe	5
466	Itamaraju	5
467	Itamari	5
468	Itambé	5
469	Itanagra	5
470	Itanhém	5
471	Itaparica	5
472	Itapé	5
473	Itapebi	5
474	Itapetinga	5
475	Itapicuru	5
476	Itapitanga	5
477	Itaquara	5
478	Itarantim	5
479	Itatim	5
480	Itiruçu	5
481	Itiúba	5
482	Itororó	5
483	Ituaçu	5
484	Ituberá	5
485	Iuiú	5
486	Jaborandi	5
487	Jacaraci	5
488	Jacobina	5
489	Jaguaquara	5
490	Jaguarari	5
491	Jaguaripe	5
492	Jandaíra	5
493	Jequié	5
494	Jeremoabo	5
495	Jiquiriçá	5
496	Jitaúna	5
497	João Dourado	5
498	Juazeiro	5
499	Jucuruçu	5
500	Jussara	5
501	Jussari	5
502	Jussiape	5
503	Lafaiete Coutinho	5
504	Lagoa Real	5
505	Laje	5
506	Lajedão	5
507	Lajedinho	5
508	Lajedo do Tabocal	5
509	Lamarão	5
510	Lapão	5
511	Lauro de Freitas	5
512	Lençóis	5
513	Licínio de Almeida	5
514	Livramento de Nossa Senhora	5
515	Luís Eduardo Magalhães	5
516	Macajuba	5
517	Macarani	5
518	Macaúbas	5
519	Macururé	5
520	Madre de Deus	5
521	Maetinga	5
522	Maiquinique	5
523	Mairi	5
524	Malhada	5
525	Malhada de Pedras	5
526	Manoel Vitorino	5
527	Mansidão	5
528	Maracás	5
529	Maragogipe	5
530	Maraú	5
531	Marcionílio Souza	5
532	Mascote	5
533	Mata de São João	5
534	Matina	5
535	Medeiros Neto	5
536	Miguel Calmon	5
537	Milagres	5
538	Mirangaba	5
539	Mirante	5
540	Monte Santo	5
541	Morpará	5
542	Morro do Chapéu	5
543	Mortugaba	5
544	Mucugê	5
545	Mucuri	5
546	Mulungu do Morro	5
547	Mundo Novo	5
548	Muniz Ferreira	5
549	Muquém de São Francisco	5
550	Muritiba	5
551	Mutuípe	5
552	Nazaré	5
553	Nilo Peçanha	5
554	Nordestina	5
555	Nova Canaã	5
556	Nova Fátima	5
557	Nova Ibiá	5
558	Nova Itarana	5
559	Nova Redenção	5
560	Nova Soure	5
561	Nova Viçosa	5
562	Novo Horizonte	5
563	Novo Triunfo	5
564	Olindina	5
565	Oliveira dos Brejinhos	5
566	Ouriçangas	5
567	Ourolândia	5
568	Palmas de Monte Alto	5
569	Palmeiras	5
570	Paramirim	5
571	Paratinga	5
572	Paripiranga	5
573	Pau Brasil	5
574	Paulo Afonso	5
575	Pé de Serra	5
576	Pedrão	5
577	Pedro Alexandre	5
578	Piatã	5
579	Pilão Arcado	5
580	Pindaí	5
581	Pindobaçu	5
582	Pintadas	5
583	Piraí do Norte	5
584	Piripá	5
585	Piritiba	5
586	Planaltino	5
587	Planalto	5
588	Poções	5
589	Pojuca	5
590	Ponto Novo	5
591	Porto Seguro	5
592	Potiraguá	5
593	Prado	5
594	Presidente Dutra	5
595	Presidente Jânio Quadros	5
596	Presidente Tancredo Neves	5
597	Queimadas	5
598	Quijingue	5
599	Quixabeira	5
600	Rafael Jambeiro	5
601	Remanso	5
602	Retirolândia	5
603	Riachão das Neves	5
604	Riachão do Jacuípe	5
605	Riacho de Santana	5
606	Ribeira do Amparo	5
607	Ribeira do Pombal	5
608	Ribeirão do Largo	5
609	Rio de Contas	5
610	Rio do Antônio	5
611	Rio do Pires	5
612	Rio Real	5
613	Rodelas	5
614	Ruy Barbosa	5
615	Salinas da Margarida	5
616	Salvador	5
617	Santa Bárbara	5
618	Santa Brígida	5
619	Santa Cruz Cabrália	5
620	Santa Cruz da Vitória	5
621	Santa Inês	5
622	Santa Luzia	5
623	Santa Maria da Vitória	5
624	Santa Rita de Cássia	5
625	Santa Teresinha	5
626	Santaluz	5
627	Santana	5
628	Santanópolis	5
629	Santo Amaro	5
630	Santo Antônio de Jesus	5
631	Santo Estêvão	5
632	São Desidério	5
633	São Domingos	5
634	São Felipe	5
635	São Félix	5
636	São Félix do Coribe	5
637	São Francisco do Conde	5
638	São Gabriel	5
639	São Gonçalo dos Campos	5
640	São José da Vitória	5
641	São José do Jacuípe	5
642	São Miguel das Matas	5
643	São Sebastião do Passé	5
644	Sapeaçu	5
645	Sátiro Dias	5
646	Saubara	5
647	Saúde	5
648	Seabra	5
649	Sebastião Laranjeiras	5
650	Senhor do Bonfim	5
651	Sento Sé	5
652	Serra do Ramalho	5
653	Serra Dourada	5
654	Serra Preta	5
655	Serrinha	5
656	Serrolândia	5
657	Simões Filho	5
658	Sítio do Mato	5
659	Sítio do Quinto	5
660	Sobradinho	5
661	Souto Soares	5
662	Tabocas do Brejo Velho	5
663	Tanhaçu	5
664	Tanque Novo	5
665	Tanquinho	5
666	Taperoá	5
667	Tapiramutá	5
668	Teixeira de Freitas	5
669	Teodoro Sampaio	5
670	Teofilândia	5
671	Teolândia	5
672	Terra Nova	5
673	Tremedal	5
674	Tucano	5
675	Uauá	5
676	Ubaíra	5
677	Ubaitaba	5
678	Ubatã	5
679	Uibaí	5
680	Umburanas	5
681	Una	5
682	Urandi	5
683	Uruçuca	5
684	Utinga	5
685	Valença	5
686	Valente	5
687	Várzea da Roça	5
688	Várzea do Poço	5
689	Várzea Nova	5
690	Varzedo	5
691	Vera Cruz	5
692	Vereda	5
693	Vitória da Conquista	5
694	Wagner	5
695	Wanderley	5
696	Wenceslau Guimarães	5
697	Xique-Xique	5
698	Abaiara	6
699	Acarape	6
700	Acaraú	6
701	Acopiara	6
702	Aiuaba	6
703	Alcântaras	6
704	Altaneira	6
705	Alto Santo	6
706	Amontada	6
707	Antonina do Norte	6
708	Apuiarés	6
709	Aquiraz	6
710	Aracati	6
711	Aracoiaba	6
712	Ararendá	6
713	Araripe	6
714	Aratuba	6
715	Arneiroz	6
716	Assaré	6
717	Aurora	6
718	Baixio	6
719	Banabuiú	6
720	Barbalha	6
721	Barreira	6
722	Barro	6
723	Barroquinha	6
724	Baturité	6
725	Beberibe	6
726	Bela Cruz	6
727	Boa Viagem	6
728	Brejo Santo	6
729	Camocim	6
730	Campos Sales	6
731	Canindé	6
732	Capistrano	6
733	Caridade	6
734	Cariré	6
735	Caririaçu	6
736	Cariús	6
737	Carnaubal	6
738	Cascavel	6
739	Catarina	6
740	Catunda	6
741	Caucaia	6
742	Cedro	6
743	Chaval	6
744	Choró	6
745	Chorozinho	6
746	Coreaú	6
747	Crateús	6
748	Crato	6
749	Croatá	6
750	Cruz	6
751	Deputado Irapuan Pinheiro	6
752	Ererê	6
753	Eusébio	6
754	Farias Brito	6
755	Forquilha	6
756	Fortaleza	6
757	Fortim	6
758	Frecheirinha	6
759	General Sampaio	6
760	Graça	6
761	Granja	6
762	Granjeiro	6
763	Groaíras	6
764	Guaiúba	6
765	Guaraciaba do Norte	6
766	Guaramiranga	6
767	Hidrolândia	6
768	Horizonte	6
769	Ibaretama	6
770	Ibiapina	6
771	Ibicuitinga	6
772	Icapuí	6
773	Icó	6
774	Iguatu	6
775	Independência	6
776	Ipaporanga	6
777	Ipaumirim	6
778	Ipu	6
779	Ipueiras	6
780	Iracema	6
781	Irauçuba	6
782	Itaiçaba	6
783	Itaitinga	6
784	Itapagé	6
785	Itapipoca	6
786	Itapiúna	6
787	Itarema	6
788	Itatira	6
789	Jaguaretama	6
790	Jaguaribara	6
791	Jaguaribe	6
792	Jaguaruana	6
793	Jardim	6
794	Jati	6
795	Jijoca de Jericoacoara	6
796	Juazeiro do Norte	6
797	Jucás	6
798	Lavras da Mangabeira	6
799	Limoeiro do Norte	6
800	Madalena	6
801	Maracanaú	6
802	Maranguape	6
803	Marco	6
804	Martinópole	6
805	Massapê	6
806	Mauriti	6
807	Meruoca	6
808	Milagres	6
809	Milhã	6
810	Miraíma	6
811	Missão Velha	6
812	Mombaça	6
813	Monsenhor Tabosa	6
814	Morada Nova	6
815	Moraújo	6
816	Morrinhos	6
817	Mucambo	6
818	Mulungu	6
819	Nova Olinda	6
820	Nova Russas	6
821	Novo Oriente	6
822	Ocara	6
823	Orós	6
824	Pacajus	6
825	Pacatuba	6
826	Pacoti	6
827	Pacujá	6
828	Palhano	6
829	Palmácia	6
830	Paracuru	6
831	Paraipaba	6
832	Parambu	6
833	Paramoti	6
834	Pedra Branca	6
835	Penaforte	6
836	Pentecoste	6
837	Pereiro	6
838	Pindoretama	6
839	Piquet Carneiro	6
840	Pires Ferreira	6
841	Poranga	6
842	Porteiras	6
843	Potengi	6
844	Potiretama	6
845	Quiterianópolis	6
846	Quixadá	6
847	Quixelô	6
848	Quixeramobim	6
849	Quixeré	6
850	Redenção	6
851	Reriutaba	6
852	Russas	6
853	Saboeiro	6
854	Salitre	6
855	Santa Quitéria	6
856	Santana do Acaraú	6
857	Santana do Cariri	6
858	São Benedito	6
859	São Gonçalo do Amarante	6
860	São João do Jaguaribe	6
861	São Luís do Curu	6
862	Senador Pompeu	6
863	Senador Sá	6
864	Sobral	6
865	Solonópole	6
866	Tabuleiro do Norte	6
867	Tamboril	6
868	Tarrafas	6
869	Tauá	6
870	Tejuçuoca	6
871	Tianguá	6
872	Trairi	6
873	Tururu	6
874	Ubajara	6
875	Umari	6
876	Umirim	6
877	Uruburetama	6
878	Uruoca	6
879	Varjota	6
880	Várzea Alegre	6
881	Viçosa do Ceará	6
882	Brasília	7
883	Abadia de Goiás	9
884	Abadiânia	9
885	Acreúna	9
886	Adelândia	9
887	Água Fria de Goiás	9
888	Água Limpa	9
889	Águas Lindas de Goiás	9
890	Alexânia	9
891	Aloândia	9
892	Alto Horizonte	9
893	Alto Paraíso de Goiás	9
894	Alvorada do Norte	9
895	Amaralina	9
896	Americano do Brasil	9
897	Amorinópolis	9
898	Anápolis	9
899	Anhanguera	9
900	Anicuns	9
901	Aparecida de Goiânia	9
902	Aparecida do Rio Doce	9
903	Aporé	9
904	Araçu	9
905	Aragarças	9
906	Aragoiânia	9
907	Araguapaz	9
908	Arenópolis	9
909	Aruanã	9
910	Aurilândia	9
911	Avelinópolis	9
912	Baliza	9
913	Barro Alto	9
914	Bela Vista de Goiás	9
915	Bom Jardim de Goiás	9
916	Bom Jesus de Goiás	9
917	Bonfinópolis	9
918	Bonópolis	9
919	Brazabrantes	9
920	Britânia	9
921	Buriti Alegre	9
922	Buriti de Goiás	9
923	Buritinópolis	9
924	Cabeceiras	9
925	Cachoeira Alta	9
926	Cachoeira de Goiás	9
927	Cachoeira Dourada	9
928	Caçu	9
929	Caiapônia	9
930	Caldas Novas	9
931	Caldazinha	9
932	Campestre de Goiás	9
933	Campinaçu	9
934	Campinorte	9
935	Campo Alegre de Goiás	9
936	Campo Limpo de Goiás	9
937	Campos Belos	9
938	Campos Verdes	9
939	Carmo do Rio Verde	9
940	Castelândia	9
941	Catalão	9
942	Caturaí	9
943	Cavalcante	9
944	Ceres	9
945	Cezarina	9
946	Chapadão do Céu	9
947	Cidade Ocidental	9
948	Cocalzinho de Goiás	9
949	Colinas do Sul	9
950	Córrego do Ouro	9
951	Corumbá de Goiás	9
952	Corumbaíba	9
953	Cristalina	9
954	Cristianópolis	9
955	Crixás	9
956	Cromínia	9
957	Cumari	9
958	Damianópolis	9
959	Damolândia	9
960	Davinópolis	9
961	Diorama	9
962	Divinópolis de Goiás	9
963	Doverlândia	9
964	Edealina	9
965	Edéia	9
966	Estrela do Norte	9
967	Faina	9
968	Fazenda Nova	9
969	Firminópolis	9
970	Flores de Goiás	9
971	Formosa	9
972	Formoso	9
973	Gameleira de Goiás	9
974	Goianápolis	9
975	Goiandira	9
976	Goianésia	9
977	Goiânia	9
978	Goianira	9
979	Goiás	9
980	Goiatuba	9
981	Gouvelândia	9
982	Guapó	9
983	Guaraíta	9
984	Guarani de Goiás	9
985	Guarinos	9
986	Heitoraí	9
987	Hidrolândia	9
988	Hidrolina	9
989	Iaciara	9
990	Inaciolândia	9
991	Indiara	9
992	Inhumas	9
993	Ipameri	9
994	Ipiranga de Goiás	9
995	Iporá	9
996	Israelândia	9
997	Itaberaí	9
998	Itaguari	9
999	Itaguaru	9
1000	Itajá	9
1001	Itapaci	9
1002	Itapirapuã	9
1003	Itapuranga	9
1004	Itarumã	9
1005	Itauçu	9
1006	Itumbiara	9
1007	Ivolândia	9
1008	Jandaia	9
1009	Jaraguá	9
1010	Jataí	9
1011	Jaupaci	9
1012	Jesúpolis	9
1013	Joviânia	9
1014	Jussara	9
1015	Lagoa Santa	9
1016	Leopoldo de Bulhões	9
1017	Luziânia	9
1018	Mairipotaba	9
1019	Mambaí	9
1020	Mara Rosa	9
1021	Marzagão	9
1022	Matrinchã	9
1023	Maurilândia	9
1024	Mimoso de Goiás	9
1025	Minaçu	9
1026	Mineiros	9
1027	Moiporá	9
1028	Monte Alegre de Goiás	9
1029	Montes Claros de Goiás	9
1030	Montividiu	9
1031	Montividiu do Norte	9
1032	Morrinhos	9
1033	Morro Agudo de Goiás	9
1034	Mossâmedes	9
1035	Mozarlândia	9
1036	Mundo Novo	9
1037	Mutunópolis	9
1038	Nazário	9
1039	Nerópolis	9
1040	Niquelândia	9
1041	Nova América	9
1042	Nova Aurora	9
1043	Nova Crixás	9
1044	Nova Glória	9
1045	Nova Iguaçu de Goiás	9
1046	Nova Roma	9
1047	Nova Veneza	9
1048	Novo Brasil	9
1049	Novo Gama	9
1050	Novo Planalto	9
1051	Orizona	9
1052	Ouro Verde de Goiás	9
1053	Ouvidor	9
1054	Padre Bernardo	9
1055	Palestina de Goiás	9
1056	Palmeiras de Goiás	9
1057	Palmelo	9
1058	Palminópolis	9
1059	Panamá	9
1060	Paranaiguara	9
1061	Paraúna	9
1062	Perolândia	9
1063	Petrolina de Goiás	9
1064	Pilar de Goiás	9
1065	Piracanjuba	9
1066	Piranhas	9
1067	Pirenópolis	9
1068	Pires do Rio	9
1069	Planaltina	9
1070	Pontalina	9
1071	Porangatu	9
1072	Porteirão	9
1073	Portelândia	9
1074	Posse	9
1075	Professor Jamil	9
1076	Quirinópolis	9
1077	Rialma	9
1078	Rianápolis	9
1079	Rio Quente	9
1080	Rio Verde	9
1081	Rubiataba	9
1082	Sanclerlândia	9
1083	Santa Bárbara de Goiás	9
1084	Santa Cruz de Goiás	9
1085	Santa Fé de Goiás	9
1086	Santa Helena de Goiás	9
1087	Santa Isabel	9
1088	Santa Rita do Araguaia	9
1089	Santa Rita do Novo Destino	9
1090	Santa Rosa de Goiás	9
1091	Santa Tereza de Goiás	9
1092	Santa Terezinha de Goiás	9
1093	Santo Antônio da Barra	9
1094	Santo Antônio de Goiás	9
1095	Santo Antônio do Descoberto	9
1096	São Domingos	9
1097	São Francisco de Goiás	9
1098	São João d"Aliança	9
1099	São João da Paraúna	9
1100	São Luís de Montes Belos	9
1101	São Luíz do Norte	9
1102	São Miguel do Araguaia	9
1103	São Miguel do Passa Quatro	9
1104	São Patrício	9
1105	São Simão	9
1106	Senador Canedo	9
1107	Serranópolis	9
1108	Silvânia	9
1109	Simolândia	9
1110	Sítio d"Abadia	9
1111	Taquaral de Goiás	9
1112	Teresina de Goiás	9
1113	Terezópolis de Goiás	9
1114	Três Ranchos	9
1115	Trindade	9
1116	Trombas	9
1117	Turvânia	9
1118	Turvelândia	9
1119	Uirapuru	9
1120	Uruaçu	9
1121	Uruana	9
1122	Urutaí	9
1123	Valparaíso de Goiás	9
1124	Varjão	9
1125	Vianópolis	9
1126	Vicentinópolis	9
1127	Vila Boa	9
1128	Vila Propício	9
1129	Açailândia	10
1130	Afonso Cunha	10
1131	Água Doce do Maranhão	10
1132	Alcântara	10
1133	Aldeias Altas	10
1134	Altamira do Maranhão	10
1135	Alto Alegre do Maranhão	10
1136	Alto Alegre do Pindaré	10
1137	Alto Parnaíba	10
1138	Amapá do Maranhão	10
1139	Amarante do Maranhão	10
1140	Anajatuba	10
1141	Anapurus	10
1142	Apicum-Açu	10
1143	Araguanã	10
1144	Araioses	10
1145	Arame	10
1146	Arari	10
1147	Axixá	10
1148	Bacabal	10
1149	Bacabeira	10
1150	Bacuri	10
1151	Bacurituba	10
1152	Balsas	10
1153	Barão de Grajaú	10
1154	Barra do Corda	10
1155	Barreirinhas	10
1156	Bela Vista do Maranhão	10
1157	Belágua	10
1158	Benedito Leite	10
1159	Bequimão	10
1160	Bernardo do Mearim	10
1161	Boa Vista do Gurupi	10
1162	Bom Jardim	10
1163	Bom Jesus das Selvas	10
1164	Bom Lugar	10
1165	Brejo	10
1166	Brejo de Areia	10
1167	Buriti	10
1168	Buriti Bravo	10
1169	Buriticupu	10
1170	Buritirana	10
1171	Cachoeira Grande	10
1172	Cajapió	10
1173	Cajari	10
1174	Campestre do Maranhão	10
1175	Cândido Mendes	10
1176	Cantanhede	10
1177	Capinzal do Norte	10
1178	Carolina	10
1179	Carutapera	10
1180	Caxias	10
1181	Cedral	10
1182	Central do Maranhão	10
1183	Centro do Guilherme	10
1184	Centro Novo do Maranhão	10
1185	Chapadinha	10
1186	Cidelândia	10
1187	Codó	10
1188	Coelho Neto	10
1189	Colinas	10
1190	Conceição do Lago-Açu	10
1191	Coroatá	10
1192	Cururupu	10
1193	Davinópolis	10
1194	Dom Pedro	10
1195	Duque Bacelar	10
1196	Esperantinópolis	10
1197	Estreito	10
1198	Feira Nova do Maranhão	10
1199	Fernando Falcão	10
1200	Formosa da Serra Negra	10
1201	Fortaleza dos Nogueiras	10
1202	Fortuna	10
1203	Godofredo Viana	10
1204	Gonçalves Dias	10
1205	Governador Archer	10
1206	Governador Edison Lobão	10
1207	Governador Eugênio Barros	10
1208	Governador Luiz Rocha	10
1209	Governador Newton Bello	10
1210	Governador Nunes Freire	10
1211	Graça Aranha	10
1212	Grajaú	10
1213	Guimarães	10
1214	Humberto de Campos	10
1215	Icatu	10
1216	Igarapé do Meio	10
1217	Igarapé Grande	10
1218	Imperatriz	10
1219	Itaipava do Grajaú	10
1220	Itapecuru Mirim	10
1221	Itinga do Maranhão	10
1222	Jatobá	10
1223	Jenipapo dos Vieiras	10
1224	João Lisboa	10
1225	Joselândia	10
1226	Junco do Maranhão	10
1227	Lago da Pedra	10
1228	Lago do Junco	10
1229	Lago dos Rodrigues	10
1230	Lago Verde	10
1231	Lagoa do Mato	10
1232	Lagoa Grande do Maranhão	10
1233	Lajeado Novo	10
1234	Lima Campos	10
1235	Loreto	10
1236	Luís Domingues	10
1237	Magalhães de Almeida	10
1238	Maracaçumé	10
1239	Marajá do Sena	10
1240	Maranhãozinho	10
1241	Mata Roma	10
1242	Matinha	10
1243	Matões	10
1244	Matões do Norte	10
1245	Milagres do Maranhão	10
1246	Mirador	10
1247	Miranda do Norte	10
1248	Mirinzal	10
1249	Monção	10
1250	Montes Altos	10
1251	Morros	10
1252	Nina Rodrigues	10
1253	Nova Colinas	10
1254	Nova Iorque	10
1255	Nova Olinda do Maranhão	10
1256	Olho d"Água das Cunhãs	10
1257	Olinda Nova do Maranhão	10
1258	Paço do Lumiar	10
1259	Palmeirândia	10
1260	Paraibano	10
1261	Parnarama	10
1262	Passagem Franca	10
1263	Pastos Bons	10
1264	Paulino Neves	10
1265	Paulo Ramos	10
1266	Pedreiras	10
1267	Pedro do Rosário	10
1268	Penalva	10
1269	Peri Mirim	10
1270	Peritoró	10
1271	Pindaré-Mirim	10
1272	Pinheiro	10
1273	Pio XII	10
1274	Pirapemas	10
1275	Poção de Pedras	10
1276	Porto Franco	10
1277	Porto Rico do Maranhão	10
1278	Presidente Dutra	10
1279	Presidente Juscelino	10
1280	Presidente Médici	10
1281	Presidente Sarney	10
1282	Presidente Vargas	10
1283	Primeira Cruz	10
1284	Raposa	10
1285	Riachão	10
1286	Ribamar Fiquene	10
1287	Rosário	10
1288	Sambaíba	10
1289	Santa Filomena do Maranhão	10
1290	Santa Helena	10
1291	Santa Inês	10
1292	Santa Luzia	10
1293	Santa Luzia do Paruá	10
1294	Santa Quitéria do Maranhão	10
1295	Santa Rita	10
1296	Santana do Maranhão	10
1297	Santo Amaro do Maranhão	10
1298	Santo Antônio dos Lopes	10
1299	São Benedito do Rio Preto	10
1300	São Bento	10
1301	São Bernardo	10
1302	São Domingos do Azeitão	10
1303	São Domingos do Maranhão	10
1304	São Félix de Balsas	10
1305	São Francisco do Brejão	10
1306	São Francisco do Maranhão	10
1307	São João Batista	10
1308	São João do Carú	10
1309	São João do Paraíso	10
1310	São João do Soter	10
1311	São João dos Patos	10
1312	São José de Ribamar	10
1313	São José dos Basílios	10
1314	São Luís	10
1315	São Luís Gonzaga do Maranhão	10
1316	São Mateus do Maranhão	10
1317	São Pedro da Água Branca	10
1318	São Pedro dos Crentes	10
1319	São Raimundo das Mangabeiras	10
1320	São Raimundo do Doca Bezerra	10
1321	São Roberto	10
1322	São Vicente Ferrer	10
1323	Satubinha	10
1324	Senador Alexandre Costa	10
1325	Senador La Rocque	10
1326	Serrano do Maranhão	10
1327	Sítio Novo	10
1328	Sucupira do Norte	10
1329	Sucupira do Riachão	10
1330	Tasso Fragoso	10
1331	Timbiras	10
1332	Timon	10
1333	Trizidela do Vale	10
1334	Tufilândia	10
1335	Tuntum	10
1336	Turiaçu	10
1337	Turilândia	10
1338	Tutóia	10
1339	Urbano Santos	10
1340	Vargem Grande	10
1341	Viana	10
1342	Vila Nova dos Martírios	10
1343	Vitória do Mearim	10
1344	Vitorino Freire	10
1345	Zé Doca	10
1346	Acorizal	13
1347	Água Boa	13
1348	Alta Floresta	13
1349	Alto Araguaia	13
1350	Alto Boa Vista	13
1351	Alto Garças	13
1352	Alto Paraguai	13
1353	Alto Taquari	13
1354	Apiacás	13
1355	Araguaiana	13
1356	Araguainha	13
1357	Araputanga	13
1358	Arenápolis	13
1359	Aripuanã	13
1360	Barão de Melgaço	13
1361	Barra do Bugres	13
1362	Barra do Garças	13
1363	Bom Jesus do Araguaia	13
1364	Brasnorte	13
1365	Cáceres	13
1366	Campinápolis	13
1367	Campo Novo do Parecis	13
1368	Campo Verde	13
1369	Campos de Júlio	13
1370	Canabrava do Norte	13
1371	Canarana	13
1372	Carlinda	13
1373	Castanheira	13
1374	Chapada dos Guimarães	13
1375	Cláudia	13
1376	Cocalinho	13
1377	Colíder	13
1378	Colniza	13
1379	Comodoro	13
1380	Confresa	13
1381	Conquista d"Oeste	13
1382	Cotriguaçu	13
1383	Cuiabá	13
1384	Curvelândia	13
1385	Curvelândia	13
1386	Denise	13
1387	Diamantino	13
1388	Dom Aquino	13
1389	Feliz Natal	13
1390	Figueirópolis d"Oeste	13
1391	Gaúcha do Norte	13
1392	General Carneiro	13
1393	Glória d"Oeste	13
1394	Guarantã do Norte	13
1395	Guiratinga	13
1396	Indiavaí	13
1397	Ipiranga do Norte	13
1398	Itanhangá	13
1399	Itaúba	13
1400	Itiquira	13
1401	Jaciara	13
1402	Jangada	13
1403	Jauru	13
1404	Juara	13
1405	Juína	13
1406	Juruena	13
1407	Juscimeira	13
1408	Lambari d"Oeste	13
1409	Lucas do Rio Verde	13
1410	Luciára	13
1411	Marcelândia	13
1412	Matupá	13
1413	Mirassol d"Oeste	13
1414	Nobres	13
1415	Nortelândia	13
1416	Nossa Senhora do Livramento	13
1417	Nova Bandeirantes	13
1418	Nova Brasilândia	13
1419	Nova Canaã do Norte	13
1420	Nova Guarita	13
1421	Nova Lacerda	13
1422	Nova Marilândia	13
1423	Nova Maringá	13
1424	Nova Monte verde	13
1425	Nova Mutum	13
1426	Nova Olímpia	13
1427	Nova Santa Helena	13
1428	Nova Ubiratã	13
1429	Nova Xavantina	13
1430	Novo Horizonte do Norte	13
1431	Novo Mundo	13
1432	Novo Santo Antônio	13
1433	Novo São Joaquim	13
1434	Paranaíta	13
1435	Paranatinga	13
1436	Pedra Preta	13
1437	Peixoto de Azevedo	13
1438	Planalto da Serra	13
1439	Poconé	13
1440	Pontal do Araguaia	13
1441	Ponte Branca	13
1442	Pontes e Lacerda	13
1443	Porto Alegre do Norte	13
1444	Porto dos Gaúchos	13
1445	Porto Esperidião	13
1446	Porto Estrela	13
1447	Poxoréo	13
1448	Primavera do Leste	13
1449	Querência	13
1450	Reserva do Cabaçal	13
1451	Ribeirão Cascalheira	13
1452	Ribeirãozinho	13
1453	Rio Branco	13
1454	Rondolândia	13
1455	Rondonópolis	13
1456	Rosário Oeste	13
1457	Salto do Céu	13
1458	Santa Carmem	13
1459	Santa Cruz do Xingu	13
1460	Santa Rita do Trivelato	13
1461	Santa Terezinha	13
1462	Santo Afonso	13
1463	Santo Antônio do Leste	13
1464	Santo Antônio do Leverger	13
1465	São Félix do Araguaia	13
1466	São José do Povo	13
1467	São José do Rio Claro	13
1468	São José do Xingu	13
1469	São José dos Quatro Marcos	13
1470	São Pedro da Cipa	13
1471	Sapezal	13
1472	Serra Nova Dourada	13
1473	Sinop	13
1474	Sorriso	13
1475	Tabaporã	13
1476	Tangará da Serra	13
1477	Tapurah	13
1478	Terra Nova do Norte	13
1479	Tesouro	13
1480	Torixoréu	13
1481	União do Sul	13
1482	Vale de São Domingos	13
1483	Várzea Grande	13
1484	Vera	13
1485	Vila Bela da Santíssima Trindade	13
1486	Vila Rica	13
1487	Água Clara	12
1488	Alcinópolis	12
1489	Amambaí	12
1490	Anastácio	12
1491	Anaurilândia	12
1492	Angélica	12
1493	Antônio João	12
1494	Aparecida do Taboado	12
1495	Aquidauana	12
1496	Aral Moreira	12
1497	Bandeirantes	12
1498	Bataguassu	12
1499	Bataiporã	12
1500	Bela Vista	12
1501	Bodoquena	12
1502	Bonito	12
1503	Brasilândia	12
1504	Caarapó	12
1505	Camapuã	12
1506	Campo Grande	12
1507	Caracol	12
1508	Cassilândia	12
1509	Chapadão do Sul	12
1510	Corguinho	12
1511	Coronel Sapucaia	12
1512	Corumbá	12
1513	Costa Rica	12
1514	Coxim	12
1515	Deodápolis	12
1516	Dois Irmãos do Buriti	12
1517	Douradina	12
1518	Dourados	12
1519	Eldorado	12
1520	Fátima do Sul	12
1521	Figueirão	12
1522	Glória de Dourados	12
1523	Guia Lopes da Laguna	12
1524	Iguatemi	12
1525	Inocência	12
1526	Itaporã	12
1527	Itaquiraí	12
1528	Ivinhema	12
1529	Japorã	12
1530	Jaraguari	12
1531	Jardim	12
1532	Jateí	12
1533	Juti	12
1534	Ladário	12
1535	Laguna Carapã	12
1536	Maracaju	12
1537	Miranda	12
1538	Mundo Novo	12
1539	Naviraí	12
1540	Nioaque	12
1541	Nova Alvorada do Sul	12
1542	Nova Andradina	12
1543	Novo Horizonte do Sul	12
1544	Paranaíba	12
1545	Paranhos	12
1546	Pedro Gomes	12
1547	Ponta Porã	12
1548	Porto Murtinho	12
1549	Ribas do Rio Pardo	12
1550	Rio Brilhante	12
1551	Rio Negro	12
1552	Rio Verde de Mato Grosso	12
1553	Rochedo	12
1554	Santa Rita do Pardo	12
1555	São Gabriel do Oeste	12
1556	Selvíria	12
1557	Sete Quedas	12
1558	Sidrolândia	12
1559	Sonora	12
1560	Tacuru	12
1561	Taquarussu	12
1562	Terenos	12
1563	Três Lagoas	12
1564	Vicentina	12
1565	Abadia dos Dourados	11
1566	Abaeté	11
1567	Abre Campo	11
1568	Acaiaca	11
1569	Açucena	11
1570	Água Boa	11
1571	Água Comprida	11
1572	Aguanil	11
1573	Águas Formosas	11
1574	Águas Vermelhas	11
1575	Aimorés	11
1576	Aiuruoca	11
1577	Alagoa	11
1578	Albertina	11
1579	Além Paraíba	11
1580	Alfenas	11
1581	Alfredo Vasconcelos	11
1582	Almenara	11
1583	Alpercata	11
1584	Alpinópolis	11
1585	Alterosa	11
1586	Alto Caparaó	11
1587	Alto Jequitibá	11
1588	Alto Rio Doce	11
1589	Alvarenga	11
1590	Alvinópolis	11
1591	Alvorada de Minas	11
1592	Amparo do Serra	11
1593	Andradas	11
1594	Andrelândia	11
1595	Angelândia	11
1596	Antônio Carlos	11
1597	Antônio Dias	11
1598	Antônio Prado de Minas	11
1599	Araçaí	11
1600	Aracitaba	11
1601	Araçuaí	11
1602	Araguari	11
1603	Arantina	11
1604	Araponga	11
1605	Araporã	11
1606	Arapuá	11
1607	Araújos	11
1608	Araxá	11
1609	Arceburgo	11
1610	Arcos	11
1611	Areado	11
1612	Argirita	11
1613	Aricanduva	11
1614	Arinos	11
1615	Astolfo Dutra	11
1616	Ataléia	11
1617	Augusto de Lima	11
1618	Baependi	11
1619	Baldim	11
1620	Bambuí	11
1621	Bandeira	11
1622	Bandeira do Sul	11
1623	Barão de Cocais	11
1624	Barão de Monte Alto	11
1625	Barbacena	11
1626	Barra Longa	11
1627	Barroso	11
1628	Bela Vista de Minas	11
1629	Belmiro Braga	11
1630	Belo Horizonte	11
1631	Belo Oriente	11
1632	Belo Vale	11
1633	Berilo	11
1634	Berizal	11
1635	Bertópolis	11
1636	Betim	11
1637	Bias Fortes	11
1638	Bicas	11
1639	Biquinhas	11
1640	Boa Esperança	11
1641	Bocaina de Minas	11
1642	Bocaiúva	11
1643	Bom Despacho	11
1644	Bom Jardim de Minas	11
1645	Bom Jesus da Penha	11
1646	Bom Jesus do Amparo	11
1647	Bom Jesus do Galho	11
1648	Bom Repouso	11
1649	Bom Sucesso	11
1650	Bonfim	11
1651	Bonfinópolis de Minas	11
1652	Bonito de Minas	11
1653	Borda da Mata	11
1654	Botelhos	11
1655	Botumirim	11
1656	Brás Pires	11
1657	Brasilândia de Minas	11
1658	Brasília de Minas	11
1659	Brasópolis	11
1660	Braúnas	11
1661	Brumadinho	11
1662	Bueno Brandão	11
1663	Buenópolis	11
1664	Bugre	11
1665	Buritis	11
1666	Buritizeiro	11
1667	Cabeceira Grande	11
1668	Cabo Verde	11
1669	Cachoeira da Prata	11
1670	Cachoeira de Minas	11
1671	Cachoeira de Pajeú	11
1672	Cachoeira Dourada	11
1673	Caetanópolis	11
1674	Caeté	11
1675	Caiana	11
1676	Cajuri	11
1677	Caldas	11
1678	Camacho	11
1679	Camanducaia	11
1680	Cambuí	11
1681	Cambuquira	11
1682	Campanário	11
1683	Campanha	11
1684	Campestre	11
1685	Campina Verde	11
1686	Campo Azul	11
1687	Campo Belo	11
1688	Campo do Meio	11
1689	Campo Florido	11
1690	Campos Altos	11
1691	Campos Gerais	11
1692	Cana Verde	11
1693	Canaã	11
1694	Canápolis	11
1695	Candeias	11
1696	Cantagalo	11
1697	Caparaó	11
1698	Capela Nova	11
1699	Capelinha	11
1700	Capetinga	11
1701	Capim Branco	11
1702	Capinópolis	11
1703	Capitão Andrade	11
1704	Capitão Enéas	11
1705	Capitólio	11
1706	Caputira	11
1707	Caraí	11
1708	Caranaíba	11
1709	Carandaí	11
1710	Carangola	11
1711	Caratinga	11
1712	Carbonita	11
1713	Careaçu	11
1714	Carlos Chagas	11
1715	Carmésia	11
1716	Carmo da Cachoeira	11
1717	Carmo da Mata	11
1718	Carmo de Minas	11
1719	Carmo do Cajuru	11
1720	Carmo do Paranaíba	11
1721	Carmo do Rio Claro	11
1722	Carmópolis de Minas	11
1723	Carneirinho	11
1724	Carrancas	11
1725	Carvalhópolis	11
1726	Carvalhos	11
1727	Casa Grande	11
1728	Cascalho Rico	11
1729	Cássia	11
1730	Cataguases	11
1731	Catas Altas	11
1732	Catas Altas da Noruega	11
1733	Catuji	11
1734	Catuti	11
1735	Caxambu	11
1736	Cedro do Abaeté	11
1737	Central de Minas	11
1738	Centralina	11
1739	Chácara	11
1740	Chalé	11
1741	Chapada do Norte	11
1742	Chapada Gaúcha	11
1743	Chiador	11
1744	Cipotânea	11
1745	Claraval	11
1746	Claro dos Poções	11
1747	Cláudio	11
1748	Coimbra	11
1749	Coluna	11
1750	Comendador Gomes	11
1751	Comercinho	11
1752	Conceição da Aparecida	11
1753	Conceição da Barra de Minas	11
1754	Conceição das Alagoas	11
1755	Conceição das Pedras	11
1756	Conceição de Ipanema	11
1757	Conceição do Mato Dentro	11
1758	Conceição do Pará	11
1759	Conceição do Rio Verde	11
1760	Conceição dos Ouros	11
1761	Cônego Marinho	11
1762	Confins	11
1763	Congonhal	11
1764	Congonhas	11
1765	Congonhas do Norte	11
1766	Conquista	11
1767	Conselheiro Lafaiete	11
1768	Conselheiro Pena	11
1769	Consolação	11
1770	Contagem	11
1771	Coqueiral	11
1772	Coração de Jesus	11
1773	Cordisburgo	11
1774	Cordislândia	11
1775	Corinto	11
1776	Coroaci	11
1777	Coromandel	11
1778	Coronel Fabriciano	11
1779	Coronel Murta	11
1780	Coronel Pacheco	11
1781	Coronel Xavier Chaves	11
1782	Córrego Danta	11
1783	Córrego do Bom Jesus	11
1784	Córrego Fundo	11
1785	Córrego Novo	11
1786	Couto de Magalhães de Minas	11
1787	Crisólita	11
1788	Cristais	11
1789	Cristália	11
1790	Cristiano Otoni	11
1791	Cristina	11
1792	Crucilândia	11
1793	Cruzeiro da Fortaleza	11
1794	Cruzília	11
1795	Cuparaque	11
1796	Curral de Dentro	11
1797	Curvelo	11
1798	Datas	11
1799	Delfim Moreira	11
1800	Delfinópolis	11
1801	Delta	11
1802	Descoberto	11
1803	Desterro de Entre Rios	11
1804	Desterro do Melo	11
1805	Diamantina	11
1806	Diogo de Vasconcelos	11
1807	Dionísio	11
1808	Divinésia	11
1809	Divino	11
1810	Divino das Laranjeiras	11
1811	Divinolândia de Minas	11
1812	Divinópolis	11
1813	Divisa Alegre	11
1814	Divisa Nova	11
1815	Divisópolis	11
1816	Dom Bosco	11
1817	Dom Cavati	11
1818	Dom Joaquim	11
1819	Dom Silvério	11
1820	Dom Viçoso	11
1821	Dona Eusébia	11
1822	Dores de Campos	11
1823	Dores de Guanhães	11
1824	Dores do Indaiá	11
1825	Dores do Turvo	11
1826	Doresópolis	11
1827	Douradoquara	11
1828	Durandé	11
1829	Elói Mendes	11
1830	Engenheiro Caldas	11
1831	Engenheiro Navarro	11
1832	Entre Folhas	11
1833	Entre Rios de Minas	11
1834	Ervália	11
1835	Esmeraldas	11
1836	Espera Feliz	11
1837	Espinosa	11
1838	Espírito Santo do Dourado	11
1839	Estiva	11
1840	Estrela Dalva	11
1841	Estrela do Indaiá	11
1842	Estrela do Sul	11
1843	Eugenópolis	11
1844	Ewbank da Câmara	11
1845	Extrema	11
1846	Fama	11
1847	Faria Lemos	11
1848	Felício dos Santos	11
1849	Felisburgo	11
1850	Felixlândia	11
1851	Fernandes Tourinho	11
1852	Ferros	11
1853	Fervedouro	11
1854	Florestal	11
1855	Formiga	11
1856	Formoso	11
1857	Fortaleza de Minas	11
1858	Fortuna de Minas	11
1859	Francisco Badaró	11
1860	Francisco Dumont	11
1861	Francisco Sá	11
1862	Franciscópolis	11
1863	Frei Gaspar	11
1864	Frei Inocêncio	11
1865	Frei Lagonegro	11
1866	Fronteira	11
1867	Fronteira dos Vales	11
1868	Fruta de Leite	11
1869	Frutal	11
1870	Funilândia	11
1871	Galiléia	11
1872	Gameleiras	11
1873	Glaucilândia	11
1874	Goiabeira	11
1875	Goianá	11
1876	Gonçalves	11
1877	Gonzaga	11
1878	Gouveia	11
1879	Governador Valadares	11
1880	Grão Mogol	11
1881	Grupiara	11
1882	Guanhães	11
1883	Guapé	11
1884	Guaraciaba	11
1885	Guaraciama	11
1886	Guaranésia	11
1887	Guarani	11
1888	Guarará	11
1889	Guarda-Mor	11
1890	Guaxupé	11
1891	Guidoval	11
1892	Guimarânia	11
1893	Guiricema	11
1894	Gurinhatã	11
1895	Heliodora	11
1896	Iapu	11
1897	Ibertioga	11
1898	Ibiá	11
1899	Ibiaí	11
1900	Ibiracatu	11
1901	Ibiraci	11
1902	Ibirité	11
1903	Ibitiúra de Minas	11
1904	Ibituruna	11
1905	Icaraí de Minas	11
1906	Igarapé	11
1907	Igaratinga	11
1908	Iguatama	11
1909	Ijaci	11
1910	Ilicínea	11
1911	Imbé de Minas	11
1912	Inconfidentes	11
1913	Indaiabira	11
1914	Indianópolis	11
1915	Ingaí	11
1916	Inhapim	11
1917	Inhaúma	11
1918	Inimutaba	11
1919	Ipaba	11
1920	Ipanema	11
1921	Ipatinga	11
1922	Ipiaçu	11
1923	Ipuiúna	11
1924	Iraí de Minas	11
1925	Itabira	11
1926	Itabirinha de Mantena	11
1927	Itabirito	11
1928	Itacambira	11
1929	Itacarambi	11
1930	Itaguara	11
1931	Itaipé	11
1932	Itajubá	11
1933	Itamarandiba	11
1934	Itamarati de Minas	11
1935	Itambacuri	11
1936	Itambé do Mato Dentro	11
1937	Itamogi	11
1938	Itamonte	11
1939	Itanhandu	11
1940	Itanhomi	11
1941	Itaobim	11
1942	Itapagipe	11
1943	Itapecerica	11
1944	Itapeva	11
1945	Itatiaiuçu	11
1946	Itaú de Minas	11
1947	Itaúna	11
1948	Itaverava	11
1949	Itinga	11
1950	Itueta	11
1951	Ituiutaba	11
1952	Itumirim	11
1953	Iturama	11
1954	Itutinga	11
1955	Jaboticatubas	11
1956	Jacinto	11
1957	Jacuí	11
1958	Jacutinga	11
1959	Jaguaraçu	11
1960	Jaíba	11
1961	Jampruca	11
1962	Janaúba	11
1963	Januária	11
1964	Japaraíba	11
1965	Japonvar	11
1966	Jeceaba	11
1967	Jenipapo de Minas	11
1968	Jequeri	11
1969	Jequitaí	11
1970	Jequitibá	11
1971	Jequitinhonha	11
1972	Jesuânia	11
1973	Joaíma	11
1974	Joanésia	11
1975	João Monlevade	11
1976	João Pinheiro	11
1977	Joaquim Felício	11
1978	Jordânia	11
1979	José Gonçalves de Minas	11
1980	José Raydan	11
1981	Josenópolis	11
1982	Juatuba	11
1983	Juiz de Fora	11
1984	Juramento	11
1985	Juruaia	11
1986	Juvenília	11
1987	Ladainha	11
1988	Lagamar	11
1989	Lagoa da Prata	11
1990	Lagoa dos Patos	11
1991	Lagoa Dourada	11
1992	Lagoa Formosa	11
1993	Lagoa Grande	11
1994	Lagoa Santa	11
1995	Lajinha	11
1996	Lambari	11
1997	Lamim	11
1998	Laranjal	11
1999	Lassance	11
2000	Lavras	11
2001	Leandro Ferreira	11
2002	Leme do Prado	11
2003	Leopoldina	11
2004	Liberdade	11
2005	Lima Duarte	11
2006	Limeira do Oeste	11
2007	Lontra	11
2008	Luisburgo	11
2009	Luislândia	11
2010	Luminárias	11
2011	Luz	11
2012	Machacalis	11
2013	Machado	11
2014	Madre de Deus de Minas	11
2015	Malacacheta	11
2016	Mamonas	11
2017	Manga	11
2018	Manhuaçu	11
2019	Manhumirim	11
2020	Mantena	11
2021	Mar de Espanha	11
2022	Maravilhas	11
2023	Maria da Fé	11
2024	Mariana	11
2025	Marilac	11
2026	Mário Campos	11
2027	Maripá de Minas	11
2028	Marliéria	11
2029	Marmelópolis	11
2030	Martinho Campos	11
2031	Martins Soares	11
2032	Mata Verde	11
2033	Materlândia	11
2034	Mateus Leme	11
2035	Mathias Lobato	11
2036	Matias Barbosa	11
2037	Matias Cardoso	11
2038	Matipó	11
2039	Mato Verde	11
2040	Matozinhos	11
2041	Matutina	11
2042	Medeiros	11
2043	Medina	11
2044	Mendes Pimentel	11
2045	Mercês	11
2046	Mesquita	11
2047	Minas Novas	11
2048	Minduri	11
2049	Mirabela	11
2050	Miradouro	11
2051	Miraí	11
2052	Miravânia	11
2053	Moeda	11
2054	Moema	11
2055	Monjolos	11
2056	Monsenhor Paulo	11
2057	Montalvânia	11
2058	Monte Alegre de Minas	11
2059	Monte Azul	11
2060	Monte Belo	11
2061	Monte Carmelo	11
2062	Monte Formoso	11
2063	Monte Santo de Minas	11
2064	Monte Sião	11
2065	Montes Claros	11
2066	Montezuma	11
2067	Morada Nova de Minas	11
2068	Morro da Garça	11
2069	Morro do Pilar	11
2070	Munhoz	11
2071	Muriaé	11
2072	Mutum	11
2073	Muzambinho	11
2074	Nacip Raydan	11
2075	Nanuque	11
2076	Naque	11
2077	Natalândia	11
2078	Natércia	11
2079	Nazareno	11
2080	Nepomuceno	11
2081	Ninheira	11
2082	Nova Belém	11
2083	Nova Era	11
2084	Nova Lima	11
2085	Nova Módica	11
2086	Nova Ponte	11
2087	Nova Porteirinha	11
2088	Nova Resende	11
2089	Nova Serrana	11
2090	Nova União	11
2091	Novo Cruzeiro	11
2092	Novo Oriente de Minas	11
2093	Novorizonte	11
2094	Olaria	11
2095	Olhos-d"Água	11
2096	Olímpio Noronha	11
2097	Oliveira	11
2098	Oliveira Fortes	11
2099	Onça de Pitangui	11
2100	Oratórios	11
2101	Orizânia	11
2102	Ouro Branco	11
2103	Ouro Fino	11
2104	Ouro Preto	11
2105	Ouro Verde de Minas	11
2106	Padre Carvalho	11
2107	Padre Paraíso	11
2108	Pai Pedro	11
2109	Paineiras	11
2110	Pains	11
2111	Paiva	11
2112	Palma	11
2113	Palmópolis	11
2114	Papagaios	11
2115	Pará de Minas	11
2116	Paracatu	11
2117	Paraguaçu	11
2118	Paraisópolis	11
2119	Paraopeba	11
2120	Passa Quatro	11
2121	Passa Tempo	11
2122	Passabém	11
2123	Passa-Vinte	11
2124	Passos	11
2125	Patis	11
2126	Patos de Minas	11
2127	Patrocínio	11
2128	Patrocínio do Muriaé	11
2129	Paula Cândido	11
2130	Paulistas	11
2131	Pavão	11
2132	Peçanha	11
2133	Pedra Azul	11
2134	Pedra Bonita	11
2135	Pedra do Anta	11
2136	Pedra do Indaiá	11
2137	Pedra Dourada	11
2138	Pedralva	11
2139	Pedras de Maria da Cruz	11
2140	Pedrinópolis	11
2141	Pedro Leopoldo	11
2142	Pedro Teixeira	11
2143	Pequeri	11
2144	Pequi	11
2145	Perdigão	11
2146	Perdizes	11
2147	Perdões	11
2148	Periquito	11
2149	Pescador	11
2150	Piau	11
2151	Piedade de Caratinga	11
2152	Piedade de Ponte Nova	11
2153	Piedade do Rio Grande	11
2154	Piedade dos Gerais	11
2155	Pimenta	11
2156	Pingo-d"Água	11
2157	Pintópolis	11
2158	Piracema	11
2159	Pirajuba	11
2160	Piranga	11
2161	Piranguçu	11
2162	Piranguinho	11
2163	Pirapetinga	11
2164	Pirapora	11
2165	Piraúba	11
2166	Pitangui	11
2167	Piumhi	11
2168	Planura	11
2169	Poço Fundo	11
2170	Poços de Caldas	11
2171	Pocrane	11
2172	Pompéu	11
2173	Ponte Nova	11
2174	Ponto Chique	11
2175	Ponto dos Volantes	11
2176	Porteirinha	11
2177	Porto Firme	11
2178	Poté	11
2179	Pouso Alegre	11
2180	Pouso Alto	11
2181	Prados	11
2182	Prata	11
2183	Pratápolis	11
2184	Pratinha	11
2185	Presidente Bernardes	11
2186	Presidente Juscelino	11
2187	Presidente Kubitschek	11
2188	Presidente Olegário	11
2189	Prudente de Morais	11
2190	Quartel Geral	11
2191	Queluzito	11
2192	Raposos	11
2193	Raul Soares	11
2194	Recreio	11
2195	Reduto	11
2196	Resende Costa	11
2197	Resplendor	11
2198	Ressaquinha	11
2199	Riachinho	11
2200	Riacho dos Machados	11
2201	Ribeirão das Neves	11
2202	Ribeirão Vermelho	11
2203	Rio Acima	11
2204	Rio Casca	11
2205	Rio do Prado	11
2206	Rio Doce	11
2207	Rio Espera	11
2208	Rio Manso	11
2209	Rio Novo	11
2210	Rio Paranaíba	11
2211	Rio Pardo de Minas	11
2212	Rio Piracicaba	11
2213	Rio Pomba	11
2214	Rio Preto	11
2215	Rio Vermelho	11
2216	Ritápolis	11
2217	Rochedo de Minas	11
2218	Rodeiro	11
2219	Romaria	11
2220	Rosário da Limeira	11
2221	Rubelita	11
2222	Rubim	11
2223	Sabará	11
2224	Sabinópolis	11
2225	Sacramento	11
2226	Salinas	11
2227	Salto da Divisa	11
2228	Santa Bárbara	11
2229	Santa Bárbara do Leste	11
2230	Santa Bárbara do Monte Verde	11
2231	Santa Bárbara do Tugúrio	11
2232	Santa Cruz de Minas	11
2233	Santa Cruz de Salinas	11
2234	Santa Cruz do Escalvado	11
2235	Santa Efigênia de Minas	11
2236	Santa Fé de Minas	11
2237	Santa Helena de Minas	11
2238	Santa Juliana	11
2239	Santa Luzia	11
2240	Santa Margarida	11
2241	Santa Maria de Itabira	11
2242	Santa Maria do Salto	11
2243	Santa Maria do Suaçuí	11
2244	Santa Rita de Caldas	11
2245	Santa Rita de Ibitipoca	11
2246	Santa Rita de Jacutinga	11
2247	Santa Rita de Minas	11
2248	Santa Rita do Itueto	11
2249	Santa Rita do Sapucaí	11
2250	Santa Rosa da Serra	11
2251	Santa Vitória	11
2252	Santana da Vargem	11
2253	Santana de Cataguases	11
2254	Santana de Pirapama	11
2255	Santana do Deserto	11
2256	Santana do Garambéu	11
2257	Santana do Jacaré	11
2258	Santana do Manhuaçu	11
2259	Santana do Paraíso	11
2260	Santana do Riacho	11
2261	Santana dos Montes	11
2262	Santo Antônio do Amparo	11
2263	Santo Antônio do Aventureiro	11
2264	Santo Antônio do Grama	11
2265	Santo Antônio do Itambé	11
2266	Santo Antônio do Jacinto	11
2267	Santo Antônio do Monte	11
2268	Santo Antônio do Retiro	11
2269	Santo Antônio do Rio Abaixo	11
2270	Santo Hipólito	11
2271	Santos Dumont	11
2272	São Bento Abade	11
2273	São Brás do Suaçuí	11
2274	São Domingos das Dores	11
2275	São Domingos do Prata	11
2276	São Félix de Minas	11
2277	São Francisco	11
2278	São Francisco de Paula	11
2279	São Francisco de Sales	11
2280	São Francisco do Glória	11
2281	São Geraldo	11
2282	São Geraldo da Piedade	11
2283	São Geraldo do Baixio	11
2284	São Gonçalo do Abaeté	11
2285	São Gonçalo do Pará	11
2286	São Gonçalo do Rio Abaixo	11
2287	São Gonçalo do Rio Preto	11
2288	São Gonçalo do Sapucaí	11
2289	São Gotardo	11
2290	São João Batista do Glória	11
2291	São João da Lagoa	11
2292	São João da Mata	11
2293	São João da Ponte	11
2294	São João das Missões	11
2295	São João del Rei	11
2296	São João do Manhuaçu	11
2297	São João do Manteninha	11
2298	São João do Oriente	11
2299	São João do Pacuí	11
2300	São João do Paraíso	11
2301	São João Evangelista	11
2302	São João Nepomuceno	11
2303	São Joaquim de Bicas	11
2304	São José da Barra	11
2305	São José da Lapa	11
2306	São José da Safira	11
2307	São José da Varginha	11
2308	São José do Alegre	11
2309	São José do Divino	11
2310	São José do Goiabal	11
2311	São José do Jacuri	11
2312	São José do Mantimento	11
2313	São Lourenço	11
2314	São Miguel do Anta	11
2315	São Pedro da União	11
2316	São Pedro do Suaçuí	11
2317	São Pedro dos Ferros	11
2318	São Romão	11
2319	São Roque de Minas	11
2320	São Sebastião da Bela Vista	11
2321	São Sebastião da Vargem Alegre	11
2322	São Sebastião do Anta	11
2323	São Sebastião do Maranhão	11
2324	São Sebastião do Oeste	11
2325	São Sebastião do Paraíso	11
2326	São Sebastião do Rio Preto	11
2327	São Sebastião do Rio Verde	11
2328	São Thomé das Letras	11
2329	São Tiago	11
2330	São Tomás de Aquino	11
2331	São Vicente de Minas	11
2332	Sapucaí-Mirim	11
2333	Sardoá	11
2334	Sarzedo	11
2335	Sem-Peixe	11
2336	Senador Amaral	11
2337	Senador Cortes	11
2338	Senador Firmino	11
2339	Senador José Bento	11
2340	Senador Modestino Gonçalves	11
2341	Senhora de Oliveira	11
2342	Senhora do Porto	11
2343	Senhora dos Remédios	11
2344	Sericita	11
2345	Seritinga	11
2346	Serra Azul de Minas	11
2347	Serra da Saudade	11
2348	Serra do Salitre	11
2349	Serra dos Aimorés	11
2350	Serrania	11
2351	Serranópolis de Minas	11
2352	Serranos	11
2353	Serro	11
2354	Sete Lagoas	11
2355	Setubinha	11
2356	Silveirânia	11
2357	Silvianópolis	11
2358	Simão Pereira	11
2359	Simonésia	11
2360	Sobrália	11
2361	Soledade de Minas	11
2362	Tabuleiro	11
2363	Taiobeiras	11
2364	Taparuba	11
2365	Tapira	11
2366	Tapiraí	11
2367	Taquaraçu de Minas	11
2368	Tarumirim	11
2369	Teixeiras	11
2370	Teófilo Otoni	11
2371	Timóteo	11
2372	Tiradentes	11
2373	Tiros	11
2374	Tocantins	11
2375	Tocos do Moji	11
2376	Toledo	11
2377	Tombos	11
2378	Três Corações	11
2379	Três Marias	11
2380	Três Pontas	11
2381	Tumiritinga	11
2382	Tupaciguara	11
2383	Turmalina	11
2384	Turvolândia	11
2385	Ubá	11
2386	Ubaí	11
2387	Ubaporanga	11
2388	Uberaba	11
2389	Uberlândia	11
2390	Umburatiba	11
2391	Unaí	11
2392	União de Minas	11
2393	Uruana de Minas	11
2394	Urucânia	11
2395	Urucuia	11
2396	Vargem Alegre	11
2397	Vargem Bonita	11
2398	Vargem Grande do Rio Pardo	11
2399	Varginha	11
2400	Varjão de Minas	11
2401	Várzea da Palma	11
2402	Varzelândia	11
2403	Vazante	11
2404	Verdelândia	11
2405	Veredinha	11
2406	Veríssimo	11
2407	Vermelho Novo	11
2408	Vespasiano	11
2409	Viçosa	11
2410	Vieiras	11
2411	Virgem da Lapa	11
2412	Virgínia	11
2413	Virginópolis	11
2414	Virgolândia	11
2415	Visconde do Rio Branco	11
2416	Volta Grande	11
2417	Wenceslau Braz	11
2418	Abaetetuba	14
2419	Abel Figueiredo	14
2420	Acará	14
2421	Afuá	14
2422	Água Azul do Norte	14
2423	Alenquer	14
2424	Almeirim	14
2425	Altamira	14
2426	Anajás	14
2427	Ananindeua	14
2428	Anapu	14
2429	Augusto Corrêa	14
2430	Aurora do Pará	14
2431	Aveiro	14
2432	Bagre	14
2433	Baião	14
2434	Bannach	14
2435	Barcarena	14
2436	Belém	14
2437	Belterra	14
2438	Benevides	14
2439	Bom Jesus do Tocantins	14
2440	Bonito	14
2441	Bragança	14
2442	Brasil Novo	14
2443	Brejo Grande do Araguaia	14
2444	Breu Branco	14
2445	Breves	14
2446	Bujaru	14
2447	Cachoeira do Arari	14
2448	Cachoeira do Piriá	14
2449	Cametá	14
2450	Canaã dos Carajás	14
2451	Capanema	14
2452	Capitão Poço	14
2453	Castanhal	14
2454	Chaves	14
2455	Colares	14
2456	Conceição do Araguaia	14
2457	Concórdia do Pará	14
2458	Cumaru do Norte	14
2459	Curionópolis	14
2460	Curralinho	14
2461	Curuá	14
2462	Curuçá	14
2463	Dom Eliseu	14
2464	Eldorado dos Carajás	14
2465	Faro	14
2466	Floresta do Araguaia	14
2467	Garrafão do Norte	14
2468	Goianésia do Pará	14
2469	Gurupá	14
2470	Igarapé-Açu	14
2471	Igarapé-Miri	14
2472	Inhangapi	14
2473	Ipixuna do Pará	14
2474	Irituia	14
2475	Itaituba	14
2476	Itupiranga	14
2477	Jacareacanga	14
2478	Jacundá	14
2479	Juruti	14
2480	Limoeiro do Ajuru	14
2481	Mãe do Rio	14
2482	Magalhães Barata	14
2483	Marabá	14
2484	Maracanã	14
2485	Marapanim	14
2486	Marituba	14
2487	Medicilândia	14
2488	Melgaço	14
2489	Mocajuba	14
2490	Moju	14
2491	Monte Alegre	14
2492	Muaná	14
2493	Nova Esperança do Piriá	14
2494	Nova Ipixuna	14
2495	Nova Timboteua	14
2496	Novo Progresso	14
2497	Novo Repartimento	14
2498	Óbidos	14
2499	Oeiras do Pará	14
2500	Oriximiná	14
2501	Ourém	14
2502	Ourilândia do Norte	14
2503	Pacajá	14
2504	Palestina do Pará	14
2505	Paragominas	14
2506	Parauapebas	14
2507	Pau d"Arco	14
2508	Peixe-Boi	14
2509	Piçarra	14
2510	Placas	14
2511	Ponta de Pedras	14
2512	Portel	14
2513	Porto de Moz	14
2514	Prainha	14
2515	Primavera	14
2516	Quatipuru	14
2517	Redenção	14
2518	Rio Maria	14
2519	Rondon do Pará	14
2520	Rurópolis	14
2521	Salinópolis	14
2522	Salvaterra	14
2523	Santa Bárbara do Pará	14
2524	Santa Cruz do Arari	14
2525	Santa Isabel do Pará	14
2526	Santa Luzia do Pará	14
2527	Santa Maria das Barreiras	14
2528	Santa Maria do Pará	14
2529	Santana do Araguaia	14
2530	Santarém	14
2531	Santarém Novo	14
2532	Santo Antônio do Tauá	14
2533	São Caetano de Odivelas	14
2534	São Domingos do Araguaia	14
2535	São Domingos do Capim	14
2536	São Félix do Xingu	14
2537	São Francisco do Pará	14
2538	São Geraldo do Araguaia	14
2539	São João da Ponta	14
2540	São João de Pirabas	14
2541	São João do Araguaia	14
2542	São Miguel do Guamá	14
2543	São Sebastião da Boa Vista	14
2544	Sapucaia	14
2545	Senador José Porfírio	14
2546	Soure	14
2547	Tailândia	14
2548	Terra Alta	14
2549	Terra Santa	14
2550	Tomé-Açu	14
2551	Tracuateua	14
2552	Trairão	14
2553	Tucumã	14
2554	Tucuruí	14
2555	Ulianópolis	14
2556	Uruará	14
2557	Vigia	14
2558	Viseu	14
2559	Vitória do Xingu	14
2560	Xinguara	14
2561	Água Branca	15
2562	Aguiar	15
2563	Alagoa Grande	15
2564	Alagoa Nova	15
2565	Alagoinha	15
2566	Alcantil	15
2567	Algodão de Jandaíra	15
2568	Alhandra	15
2569	Amparo	15
2570	Aparecida	15
2571	Araçagi	15
2572	Arara	15
2573	Araruna	15
2574	Areia	15
2575	Areia de Baraúnas	15
2576	Areial	15
2577	Aroeiras	15
2578	Assunção	15
2579	Baía da Traição	15
2580	Bananeiras	15
2581	Baraúna	15
2582	Barra de Santa Rosa	15
2583	Barra de Santana	15
2584	Barra de São Miguel	15
2585	Bayeux	15
2586	Belém	15
2587	Belém do Brejo do Cruz	15
2588	Bernardino Batista	15
2589	Boa Ventura	15
2590	Boa Vista	15
2591	Bom Jesus	15
2592	Bom Sucesso	15
2593	Bonito de Santa Fé	15
2594	Boqueirão	15
2595	Borborema	15
2596	Brejo do Cruz	15
2597	Brejo dos Santos	15
2598	Caaporã	15
2599	Cabaceiras	15
2600	Cabedelo	15
2601	Cachoeira dos Índios	15
2602	Cacimba de Areia	15
2603	Cacimba de Dentro	15
2604	Cacimbas	15
2605	Caiçara	15
2606	Cajazeiras	15
2607	Cajazeirinhas	15
2608	Caldas Brandão	15
2609	Camalaú	15
2610	Campina Grande	15
2611	Campo de Santana	15
2612	Capim	15
2613	Caraúbas	15
2614	Carrapateira	15
2615	Casserengue	15
2616	Catingueira	15
2617	Catolé do Rocha	15
2618	Caturité	15
2619	Conceição	15
2620	Condado	15
2621	Conde	15
2622	Congo	15
2623	Coremas	15
2624	Coxixola	15
2625	Cruz do Espírito Santo	15
2626	Cubati	15
2627	Cuité	15
2628	Cuité de Mamanguape	15
2629	Cuitegi	15
2630	Curral de Cima	15
2631	Curral Velho	15
2632	Damião	15
2633	Desterro	15
2634	Diamante	15
2635	Dona Inês	15
2636	Duas Estradas	15
2637	Emas	15
2638	Esperança	15
2639	Fagundes	15
2640	Frei Martinho	15
2641	Gado Bravo	15
2642	Guarabira	15
2643	Gurinhém	15
2644	Gurjão	15
2645	Ibiara	15
2646	Igaracy	15
2647	Imaculada	15
2648	Ingá	15
2649	Itabaiana	15
2650	Itaporanga	15
2651	Itapororoca	15
2652	Itatuba	15
2653	Jacaraú	15
2654	Jericó	15
2655	João Pessoa	15
2656	Juarez Távora	15
2657	Juazeirinho	15
2658	Junco do Seridó	15
2659	Juripiranga	15
2660	Juru	15
2661	Lagoa	15
2662	Lagoa de Dentro	15
2663	Lagoa Seca	15
2664	Lastro	15
2665	Livramento	15
2666	Logradouro	15
2667	Lucena	15
2668	Mãe d"Água	15
2669	Malta	15
2670	Mamanguape	15
2671	Manaíra	15
2672	Marcação	15
2673	Mari	15
2674	Marizópolis	15
2675	Massaranduba	15
2676	Mataraca	15
2677	Matinhas	15
2678	Mato Grosso	15
2679	Maturéia	15
2680	Mogeiro	15
2681	Montadas	15
2682	Monte Horebe	15
2683	Monteiro	15
2684	Mulungu	15
2685	Natuba	15
2686	Nazarezinho	15
2687	Nova Floresta	15
2688	Nova Olinda	15
2689	Nova Palmeira	15
2690	Olho d"Água	15
2691	Olivedos	15
2692	Ouro Velho	15
2693	Parari	15
2694	Passagem	15
2695	Patos	15
2696	Paulista	15
2697	Pedra Branca	15
2698	Pedra Lavrada	15
2699	Pedras de Fogo	15
2700	Pedro Régis	15
2701	Piancó	15
2702	Picuí	15
2703	Pilar	15
2704	Pilões	15
2705	Pilõezinhos	15
2706	Pirpirituba	15
2707	Pitimbu	15
2708	Pocinhos	15
2709	Poço Dantas	15
2710	Poço de José de Moura	15
2711	Pombal	15
2712	Prata	15
2713	Princesa Isabel	15
2714	Puxinanã	15
2715	Queimadas	15
2716	Quixabá	15
2717	Remígio	15
2718	Riachão	15
2719	Riachão do Bacamarte	15
2720	Riachão do Poço	15
2721	Riacho de Santo Antônio	15
2722	Riacho dos Cavalos	15
2723	Rio Tinto	15
2724	Salgadinho	15
2725	Salgado de São Félix	15
2726	Santa Cecília	15
2727	Santa Cruz	15
2728	Santa Helena	15
2729	Santa Inês	15
2730	Santa Luzia	15
2731	Santa Rita	15
2732	Santa Teresinha	15
2733	Santana de Mangueira	15
2734	Santana dos Garrotes	15
2735	Santarém	15
2736	Santo André	15
2737	São Bentinho	15
2738	São Bento	15
2739	São Domingos de Pombal	15
2740	São Domingos do Cariri	15
2741	São Francisco	15
2742	São João do Cariri	15
2743	São João do Rio do Peixe	15
2744	São João do Tigre	15
2745	São José da Lagoa Tapada	15
2746	São José de Caiana	15
2747	São José de Espinharas	15
2748	São José de Piranhas	15
2749	São José de Princesa	15
2750	São José do Bonfim	15
2751	São José do Brejo do Cruz	15
2752	São José do Sabugi	15
2753	São José dos Cordeiros	15
2754	São José dos Ramos	15
2755	São Mamede	15
2756	São Miguel de Taipu	15
2757	São Sebastião de Lagoa de Roça	15
2758	São Sebastião do Umbuzeiro	15
2759	Sapé	15
2760	Seridó	15
2761	Serra Branca	15
2762	Serra da Raiz	15
2763	Serra Grande	15
2764	Serra Redonda	15
2765	Serraria	15
2766	Sertãozinho	15
2767	Sobrado	15
2768	Solânea	15
2769	Soledade	15
2770	Sossêgo	15
2771	Sousa	15
2772	Sumé	15
2773	Taperoá	15
2774	Tavares	15
2775	Teixeira	15
2776	Tenório	15
2777	Triunfo	15
2778	Uiraúna	15
2779	Umbuzeiro	15
2780	Várzea	15
2781	Vieirópolis	15
2782	Vista Serrana	15
2783	Zabelê	15
2784	Abatiá	18
2785	Adrianópolis	18
2786	Agudos do Sul	18
2787	Almirante Tamandaré	18
2788	Altamira do Paraná	18
2789	Alto Paraíso	18
2790	Alto Paraná	18
2791	Alto Piquiri	18
2792	Altônia	18
2793	Alvorada do Sul	18
2794	Amaporã	18
2795	Ampére	18
2796	Anahy	18
2797	Andirá	18
2798	Ângulo	18
2799	Antonina	18
2800	Antônio Olinto	18
2801	Apucarana	18
2802	Arapongas	18
2803	Arapoti	18
2804	Arapuã	18
2805	Araruna	18
2806	Araucária	18
2807	Ariranha do Ivaí	18
2808	Assaí	18
2809	Assis Chateaubriand	18
2810	Astorga	18
2811	Atalaia	18
2812	Balsa Nova	18
2813	Bandeirantes	18
2814	Barbosa Ferraz	18
2815	Barra do Jacaré	18
2816	Barracão	18
2817	Bela Vista da Caroba	18
2818	Bela Vista do Paraíso	18
2819	Bituruna	18
2820	Boa Esperança	18
2821	Boa Esperança do Iguaçu	18
2822	Boa Ventura de São Roque	18
2823	Boa Vista da Aparecida	18
2824	Bocaiúva do Sul	18
2825	Bom Jesus do Sul	18
2826	Bom Sucesso	18
2827	Bom Sucesso do Sul	18
2828	Borrazópolis	18
2829	Braganey	18
2830	Brasilândia do Sul	18
2831	Cafeara	18
2832	Cafelândia	18
2833	Cafezal do Sul	18
2834	Califórnia	18
2835	Cambará	18
2836	Cambé	18
2837	Cambira	18
2838	Campina da Lagoa	18
2839	Campina do Simão	18
2840	Campina Grande do Sul	18
2841	Campo Bonito	18
2842	Campo do Tenente	18
2843	Campo Largo	18
2844	Campo Magro	18
2845	Campo Mourão	18
2846	Cândido de Abreu	18
2847	Candói	18
2848	Cantagalo	18
2849	Capanema	18
2850	Capitão Leônidas Marques	18
2851	Carambeí	18
2852	Carlópolis	18
2853	Cascavel	18
2854	Castro	18
2855	Catanduvas	18
2856	Centenário do Sul	18
2857	Cerro Azul	18
2858	Céu Azul	18
2859	Chopinzinho	18
2860	Cianorte	18
2861	Cidade Gaúcha	18
2862	Clevelândia	18
2863	Colombo	18
2864	Colorado	18
2865	Congonhinhas	18
2866	Conselheiro Mairinck	18
2867	Contenda	18
2868	Corbélia	18
2869	Cornélio Procópio	18
2870	Coronel Domingos Soares	18
2871	Coronel Vivida	18
2872	Corumbataí do Sul	18
2873	Cruz Machado	18
2874	Cruzeiro do Iguaçu	18
2875	Cruzeiro do Oeste	18
2876	Cruzeiro do Sul	18
2877	Cruzmaltina	18
2878	Curitiba	18
2879	Curiúva	18
2880	Diamante d"Oeste	18
2881	Diamante do Norte	18
2882	Diamante do Sul	18
2883	Dois Vizinhos	18
2884	Douradina	18
2885	Doutor Camargo	18
2886	Doutor Ulysses	18
2887	Enéas Marques	18
2888	Engenheiro Beltrão	18
2889	Entre Rios do Oeste	18
2890	Esperança Nova	18
2891	Espigão Alto do Iguaçu	18
2892	Farol	18
2893	Faxinal	18
2894	Fazenda Rio Grande	18
2895	Fênix	18
2896	Fernandes Pinheiro	18
2897	Figueira	18
2898	Flor da Serra do Sul	18
2899	Floraí	18
2900	Floresta	18
2901	Florestópolis	18
2902	Flórida	18
2903	Formosa do Oeste	18
2904	Foz do Iguaçu	18
2905	Foz do Jordão	18
2906	Francisco Alves	18
2907	Francisco Beltrão	18
2908	General Carneiro	18
2909	Godoy Moreira	18
2910	Goioerê	18
2911	Goioxim	18
2912	Grandes Rios	18
2913	Guaíra	18
2914	Guairaçá	18
2915	Guamiranga	18
2916	Guapirama	18
2917	Guaporema	18
2918	Guaraci	18
2919	Guaraniaçu	18
2920	Guarapuava	18
2921	Guaraqueçaba	18
2922	Guaratuba	18
2923	Honório Serpa	18
2924	Ibaiti	18
2925	Ibema	18
2926	Ibiporã	18
2927	Icaraíma	18
2928	Iguaraçu	18
2929	Iguatu	18
2930	Imbaú	18
2931	Imbituva	18
2932	Inácio Martins	18
2933	Inajá	18
2934	Indianópolis	18
2935	Ipiranga	18
2936	Iporã	18
2937	Iracema do Oeste	18
2938	Irati	18
2939	Iretama	18
2940	Itaguajé	18
2941	Itaipulândia	18
2942	Itambaracá	18
2943	Itambé	18
2944	Itapejara d"Oeste	18
2945	Itaperuçu	18
2946	Itaúna do Sul	18
2947	Ivaí	18
2948	Ivaiporã	18
2949	Ivaté	18
2950	Ivatuba	18
2951	Jaboti	18
2952	Jacarezinho	18
2953	Jaguapitã	18
2954	Jaguariaíva	18
2955	Jandaia do Sul	18
2956	Janiópolis	18
2957	Japira	18
2958	Japurá	18
2959	Jardim Alegre	18
2960	Jardim Olinda	18
2961	Jataizinho	18
2962	Jesuítas	18
2963	Joaquim Távora	18
2964	Jundiaí do Sul	18
2965	Juranda	18
2966	Jussara	18
2967	Kaloré	18
2968	Lapa	18
2969	Laranjal	18
2970	Laranjeiras do Sul	18
2971	Leópolis	18
2972	Lidianópolis	18
2973	Lindoeste	18
2974	Loanda	18
2975	Lobato	18
2976	Londrina	18
2977	Luiziana	18
2978	Lunardelli	18
2979	Lupionópolis	18
2980	Mallet	18
2981	Mamborê	18
2982	Mandaguaçu	18
2983	Mandaguari	18
2984	Mandirituba	18
2985	Manfrinópolis	18
2986	Mangueirinha	18
2987	Manoel Ribas	18
2988	Marechal Cândido Rondon	18
2989	Maria Helena	18
2990	Marialva	18
2991	Marilândia do Sul	18
2992	Marilena	18
2993	Mariluz	18
2994	Maringá	18
2995	Mariópolis	18
2996	Maripá	18
2997	Marmeleiro	18
2998	Marquinho	18
2999	Marumbi	18
3000	Matelândia	18
3001	Matinhos	18
3002	Mato Rico	18
3003	Mauá da Serra	18
3004	Medianeira	18
3005	Mercedes	18
3006	Mirador	18
3007	Miraselva	18
3008	Missal	18
3009	Moreira Sales	18
3010	Morretes	18
3011	Munhoz de Melo	18
3012	Nossa Senhora das Graças	18
3013	Nova Aliança do Ivaí	18
3014	Nova América da Colina	18
3015	Nova Aurora	18
3016	Nova Cantu	18
3017	Nova Esperança	18
3018	Nova Esperança do Sudoeste	18
3019	Nova Fátima	18
3020	Nova Laranjeiras	18
3021	Nova Londrina	18
3022	Nova Olímpia	18
3023	Nova Prata do Iguaçu	18
3024	Nova Santa Bárbara	18
3025	Nova Santa Rosa	18
3026	Nova Tebas	18
3027	Novo Itacolomi	18
3028	Ortigueira	18
3029	Ourizona	18
3030	Ouro Verde do Oeste	18
3031	Paiçandu	18
3032	Palmas	18
3033	Palmeira	18
3034	Palmital	18
3035	Palotina	18
3036	Paraíso do Norte	18
3037	Paranacity	18
3038	Paranaguá	18
3039	Paranapoema	18
3040	Paranavaí	18
3041	Pato Bragado	18
3042	Pato Branco	18
3043	Paula Freitas	18
3044	Paulo Frontin	18
3045	Peabiru	18
3046	Perobal	18
3047	Pérola	18
3048	Pérola d"Oeste	18
3049	Piên	18
3050	Pinhais	18
3051	Pinhal de São Bento	18
3052	Pinhalão	18
3053	Pinhão	18
3054	Piraí do Sul	18
3055	Piraquara	18
3056	Pitanga	18
3057	Pitangueiras	18
3058	Planaltina do Paraná	18
3059	Planalto	18
3060	Ponta Grossa	18
3061	Pontal do Paraná	18
3062	Porecatu	18
3063	Porto Amazonas	18
3064	Porto Barreiro	18
3065	Porto Rico	18
3066	Porto Vitória	18
3067	Prado Ferreira	18
3068	Pranchita	18
3069	Presidente Castelo Branco	18
3070	Primeiro de Maio	18
3071	Prudentópolis	18
3072	Quarto Centenário	18
3073	Quatiguá	18
3074	Quatro Barras	18
3075	Quatro Pontes	18
3076	Quedas do Iguaçu	18
3077	Querência do Norte	18
3078	Quinta do Sol	18
3079	Quitandinha	18
3080	Ramilândia	18
3081	Rancho Alegre	18
3082	Rancho Alegre d"Oeste	18
3083	Realeza	18
3084	Rebouças	18
3085	Renascença	18
3086	Reserva	18
3087	Reserva do Iguaçu	18
3088	Ribeirão Claro	18
3089	Ribeirão do Pinhal	18
3090	Rio Azul	18
3091	Rio Bom	18
3092	Rio Bonito do Iguaçu	18
3093	Rio Branco do Ivaí	18
3094	Rio Branco do Sul	18
3095	Rio Negro	18
3096	Rolândia	18
3097	Roncador	18
3098	Rondon	18
3099	Rosário do Ivaí	18
3100	Sabáudia	18
3101	Salgado Filho	18
3102	Salto do Itararé	18
3103	Salto do Lontra	18
3104	Santa Amélia	18
3105	Santa Cecília do Pavão	18
3106	Santa Cruz de Monte Castelo	18
3107	Santa Fé	18
3108	Santa Helena	18
3109	Santa Inês	18
3110	Santa Isabel do Ivaí	18
3111	Santa Izabel do Oeste	18
3112	Santa Lúcia	18
3113	Santa Maria do Oeste	18
3114	Santa Mariana	18
3115	Santa Mônica	18
3116	Santa Tereza do Oeste	18
3117	Santa Terezinha de Itaipu	18
3118	Santana do Itararé	18
3119	Santo Antônio da Platina	18
3120	Santo Antônio do Caiuá	18
3121	Santo Antônio do Paraíso	18
3122	Santo Antônio do Sudoeste	18
3123	Santo Inácio	18
3124	São Carlos do Ivaí	18
3125	São Jerônimo da Serra	18
3126	São João	18
3127	São João do Caiuá	18
3128	São João do Ivaí	18
3129	São João do Triunfo	18
3130	São Jorge d"Oeste	18
3131	São Jorge do Ivaí	18
3132	São Jorge do Patrocínio	18
3133	São José da Boa Vista	18
3134	São José das Palmeiras	18
3135	São José dos Pinhais	18
3136	São Manoel do Paraná	18
3137	São Mateus do Sul	18
3138	São Miguel do Iguaçu	18
3139	São Pedro do Iguaçu	18
3140	São Pedro do Ivaí	18
3141	São Pedro do Paraná	18
3142	São Sebastião da Amoreira	18
3143	São Tomé	18
3144	Sapopema	18
3145	Sarandi	18
3146	Saudade do Iguaçu	18
3147	Sengés	18
3148	Serranópolis do Iguaçu	18
3149	Sertaneja	18
3150	Sertanópolis	18
3151	Siqueira Campos	18
3152	Sulina	18
3153	Tamarana	18
3154	Tamboara	18
3155	Tapejara	18
3156	Tapira	18
3157	Teixeira Soares	18
3158	Telêmaco Borba	18
3159	Terra Boa	18
3160	Terra Rica	18
3161	Terra Roxa	18
3162	Tibagi	18
3163	Tijucas do Sul	18
3164	Toledo	18
3165	Tomazina	18
3166	Três Barras do Paraná	18
3167	Tunas do Paraná	18
3168	Tuneiras do Oeste	18
3169	Tupãssi	18
3170	Turvo	18
3171	Ubiratã	18
3172	Umuarama	18
3173	União da Vitória	18
3174	Uniflor	18
3175	Uraí	18
3176	Ventania	18
3177	Vera Cruz do Oeste	18
3178	Verê	18
3179	Virmond	18
3180	Vitorino	18
3181	Wenceslau Braz	18
3182	Xambrê	18
3183	Abreu e Lima	16
3184	Afogados da Ingazeira	16
3185	Afrânio	16
3186	Agrestina	16
3187	Água Preta	16
3188	Águas Belas	16
3189	Alagoinha	16
3190	Aliança	16
3191	Altinho	16
3192	Amaraji	16
3193	Angelim	16
3194	Araçoiaba	16
3195	Araripina	16
3196	Arcoverde	16
3197	Barra de Guabiraba	16
3198	Barreiros	16
3199	Belém de Maria	16
3200	Belém de São Francisco	16
3201	Belo Jardim	16
3202	Betânia	16
3203	Bezerros	16
3204	Bodocó	16
3205	Bom Conselho	16
3206	Bom Jardim	16
3207	Bonito	16
3208	Brejão	16
3209	Brejinho	16
3210	Brejo da Madre de Deus	16
3211	Buenos Aires	16
3212	Buíque	16
3213	Cabo de Santo Agostinho	16
3214	Cabrobó	16
3215	Cachoeirinha	16
3216	Caetés	16
3217	Calçado	16
3218	Calumbi	16
3219	Camaragibe	16
3220	Camocim de São Félix	16
3221	Camutanga	16
3222	Canhotinho	16
3223	Capoeiras	16
3224	Carnaíba	16
3225	Carnaubeira da Penha	16
3226	Carpina	16
3227	Caruaru	16
3228	Casinhas	16
3229	Catende	16
3230	Cedro	16
3231	Chã de Alegria	16
3232	Chã Grande	16
3233	Condado	16
3234	Correntes	16
3235	Cortês	16
3236	Cumaru	16
3237	Cupira	16
3238	Custódia	16
3239	Dormentes	16
3240	Escada	16
3241	Exu	16
3242	Feira Nova	16
3243	Fernando de Noronha	16
3244	Ferreiros	16
3245	Flores	16
3246	Floresta	16
3247	Frei Miguelinho	16
3248	Gameleira	16
3249	Garanhuns	16
3250	Glória do Goitá	16
3251	Goiana	16
3252	Granito	16
3253	Gravatá	16
3254	Iati	16
3255	Ibimirim	16
3256	Ibirajuba	16
3257	Igarassu	16
3258	Iguaraci	16
3259	Ilha de Itamaracá	16
3260	Inajá	16
3261	Ingazeira	16
3262	Ipojuca	16
3263	Ipubi	16
3264	Itacuruba	16
3265	Itaíba	16
3266	Itambé	16
3267	Itapetim	16
3268	Itapissuma	16
3269	Itaquitinga	16
3270	Jaboatão dos Guararapes	16
3271	Jaqueira	16
3272	Jataúba	16
3273	Jatobá	16
3274	João Alfredo	16
3275	Joaquim Nabuco	16
3276	Jucati	16
3277	Jupi	16
3278	Jurema	16
3279	Lagoa do Carro	16
3280	Lagoa do Itaenga	16
3281	Lagoa do Ouro	16
3282	Lagoa dos Gatos	16
3283	Lagoa Grande	16
3284	Lajedo	16
3285	Limoeiro	16
3286	Macaparana	16
3287	Machados	16
3288	Manari	16
3289	Maraial	16
3290	Mirandiba	16
3291	Moreilândia	16
3292	Moreno	16
3293	Nazaré da Mata	16
3294	Olinda	16
3295	Orobó	16
3296	Orocó	16
3297	Ouricuri	16
3298	Palmares	16
3299	Palmeirina	16
3300	Panelas	16
3301	Paranatama	16
3302	Parnamirim	16
3303	Passira	16
3304	Paudalho	16
3305	Paulista	16
3306	Pedra	16
3307	Pesqueira	16
3308	Petrolândia	16
3309	Petrolina	16
3310	Poção	16
3311	Pombos	16
3312	Primavera	16
3313	Quipapá	16
3314	Quixaba	16
3315	Recife	16
3316	Riacho das Almas	16
3317	Ribeirão	16
3318	Rio Formoso	16
3319	Sairé	16
3320	Salgadinho	16
3321	Salgueiro	16
3322	Saloá	16
3323	Sanharó	16
3324	Santa Cruz	16
3325	Santa Cruz da Baixa Verde	16
3326	Santa Cruz do Capibaribe	16
3327	Santa Filomena	16
3328	Santa Maria da Boa Vista	16
3329	Santa Maria do Cambucá	16
3330	Santa Terezinha	16
3331	São Benedito do Sul	16
3332	São Bento do Una	16
3333	São Caitano	16
3334	São João	16
3335	São Joaquim do Monte	16
3336	São José da Coroa Grande	16
3337	São José do Belmonte	16
3338	São José do Egito	16
3339	São Lourenço da Mata	16
3340	São Vicente Ferrer	16
3341	Serra Talhada	16
3342	Serrita	16
3343	Sertânia	16
3344	Sirinhaém	16
3345	Solidão	16
3346	Surubim	16
3347	Tabira	16
3348	Tacaimbó	16
3349	Tacaratu	16
3350	Tamandaré	16
3351	Taquaritinga do Norte	16
3352	Terezinha	16
3353	Terra Nova	16
3354	Timbaúba	16
3355	Toritama	16
3356	Tracunhaém	16
3357	Trindade	16
3358	Triunfo	16
3359	Tupanatinga	16
3360	Tuparetama	16
3361	Venturosa	16
3362	Verdejante	16
3363	Vertente do Lério	16
3364	Vertentes	16
3365	Vicência	16
3366	Vitória de Santo Antão	16
3367	Xexéu	16
3368	Acauã	17
3369	Agricolândia	17
3370	Água Branca	17
3371	Alagoinha do Piauí	17
3372	Alegrete do Piauí	17
3373	Alto Longá	17
3374	Altos	17
3375	Alvorada do Gurguéia	17
3376	Amarante	17
3377	Angical do Piauí	17
3378	Anísio de Abreu	17
3379	Antônio Almeida	17
3380	Aroazes	17
3381	Aroeiras do Itaim	17
3382	Arraial	17
3383	Assunção do Piauí	17
3384	Avelino Lopes	17
3385	Baixa Grande do Ribeiro	17
3386	Barra d"Alcântara	17
3387	Barras	17
3388	Barreiras do Piauí	17
3389	Barro Duro	17
3390	Batalha	17
3391	Bela Vista do Piauí	17
3392	Belém do Piauí	17
3393	Beneditinos	17
3394	Bertolínia	17
3395	Betânia do Piauí	17
3396	Boa Hora	17
3397	Bocaina	17
3398	Bom Jesus	17
3399	Bom Princípio do Piauí	17
3400	Bonfim do Piauí	17
3401	Boqueirão do Piauí	17
3402	Brasileira	17
3403	Brejo do Piauí	17
3404	Buriti dos Lopes	17
3405	Buriti dos Montes	17
3406	Cabeceiras do Piauí	17
3407	Cajazeiras do Piauí	17
3408	Cajueiro da Praia	17
3409	Caldeirão Grande do Piauí	17
3410	Campinas do Piauí	17
3411	Campo Alegre do Fidalgo	17
3412	Campo Grande do Piauí	17
3413	Campo Largo do Piauí	17
3414	Campo Maior	17
3415	Canavieira	17
3416	Canto do Buriti	17
3417	Capitão de Campos	17
3418	Capitão Gervásio Oliveira	17
3419	Caracol	17
3420	Caraúbas do Piauí	17
3421	Caridade do Piauí	17
3422	Castelo do Piauí	17
3423	Caxingó	17
3424	Cocal	17
3425	Cocal de Telha	17
3426	Cocal dos Alves	17
3427	Coivaras	17
3428	Colônia do Gurguéia	17
3429	Colônia do Piauí	17
3430	Conceição do Canindé	17
3431	Coronel José Dias	17
3432	Corrente	17
3433	Cristalândia do Piauí	17
3434	Cristino Castro	17
3435	Curimatá	17
3436	Currais	17
3437	Curral Novo do Piauí	17
3438	Curralinhos	17
3439	Demerval Lobão	17
3440	Dirceu Arcoverde	17
3441	Dom Expedito Lopes	17
3442	Dom Inocêncio	17
3443	Domingos Mourão	17
3444	Elesbão Veloso	17
3445	Eliseu Martins	17
3446	Esperantina	17
3447	Fartura do Piauí	17
3448	Flores do Piauí	17
3449	Floresta do Piauí	17
3450	Floriano	17
3451	Francinópolis	17
3452	Francisco Ayres	17
3453	Francisco Macedo	17
3454	Francisco Santos	17
3455	Fronteiras	17
3456	Geminiano	17
3457	Gilbués	17
3458	Guadalupe	17
3459	Guaribas	17
3460	Hugo Napoleão	17
3461	Ilha Grande	17
3462	Inhuma	17
3463	Ipiranga do Piauí	17
3464	Isaías Coelho	17
3465	Itainópolis	17
3466	Itaueira	17
3467	Jacobina do Piauí	17
3468	Jaicós	17
3469	Jardim do Mulato	17
3470	Jatobá do Piauí	17
3471	Jerumenha	17
3472	João Costa	17
3473	Joaquim Pires	17
3474	Joca Marques	17
3475	José de Freitas	17
3476	Juazeiro do Piauí	17
3477	Júlio Borges	17
3478	Jurema	17
3479	Lagoa Alegre	17
3480	Lagoa de São Francisco	17
3481	Lagoa do Barro do Piauí	17
3482	Lagoa do Piauí	17
3483	Lagoa do Sítio	17
3484	Lagoinha do Piauí	17
3485	Landri Sales	17
3486	Luís Correia	17
3487	Luzilândia	17
3488	Madeiro	17
3489	Manoel Emídio	17
3490	Marcolândia	17
3491	Marcos Parente	17
3492	Massapê do Piauí	17
3493	Matias Olímpio	17
3494	Miguel Alves	17
3495	Miguel Leão	17
3496	Milton Brandão	17
3497	Monsenhor Gil	17
3498	Monsenhor Hipólito	17
3499	Monte Alegre do Piauí	17
3500	Morro Cabeça no Tempo	17
3501	Morro do Chapéu do Piauí	17
3502	Murici dos Portelas	17
3503	Nazaré do Piauí	17
3504	Nossa Senhora de Nazaré	17
3505	Nossa Senhora dos Remédios	17
3506	Nova Santa Rita	17
3507	Novo Oriente do Piauí	17
3508	Novo Santo Antônio	17
3509	Oeiras	17
3510	Olho d"Água do Piauí	17
3511	Padre Marcos	17
3512	Paes Landim	17
3513	Pajeú do Piauí	17
3514	Palmeira do Piauí	17
3515	Palmeirais	17
3516	Paquetá	17
3517	Parnaguá	17
3518	Parnaíba	17
3519	Passagem Franca do Piauí	17
3520	Patos do Piauí	17
3521	Pau d"Arco do Piauí	17
3522	Paulistana	17
3523	Pavussu	17
3524	Pedro II	17
3525	Pedro Laurentino	17
3526	Picos	17
3527	Pimenteiras	17
3528	Pio IX	17
3529	Piracuruca	17
3530	Piripiri	17
3531	Porto	17
3532	Porto Alegre do Piauí	17
3533	Prata do Piauí	17
3534	Queimada Nova	17
3535	Redenção do Gurguéia	17
3536	Regeneração	17
3537	Riacho Frio	17
3538	Ribeira do Piauí	17
3539	Ribeiro Gonçalves	17
3540	Rio Grande do Piauí	17
3541	Santa Cruz do Piauí	17
3542	Santa Cruz dos Milagres	17
3543	Santa Filomena	17
3544	Santa Luz	17
3545	Santa Rosa do Piauí	17
3546	Santana do Piauí	17
3547	Santo Antônio de Lisboa	17
3548	Santo Antônio dos Milagres	17
3549	Santo Inácio do Piauí	17
3550	São Braz do Piauí	17
3551	São Félix do Piauí	17
3552	São Francisco de Assis do Piauí	17
3553	São Francisco do Piauí	17
3554	São Gonçalo do Gurguéia	17
3555	São Gonçalo do Piauí	17
3556	São João da Canabrava	17
3557	São João da Fronteira	17
3558	São João da Serra	17
3559	São João da Varjota	17
3560	São João do Arraial	17
3561	São João do Piauí	17
3562	São José do Divino	17
3563	São José do Peixe	17
3564	São José do Piauí	17
3565	São Julião	17
3566	São Lourenço do Piauí	17
3567	São Luis do Piauí	17
3568	São Miguel da Baixa Grande	17
3569	São Miguel do Fidalgo	17
3570	São Miguel do Tapuio	17
3571	São Pedro do Piauí	17
3572	São Raimundo Nonato	17
3573	Sebastião Barros	17
3574	Sebastião Leal	17
3575	Sigefredo Pacheco	17
3576	Simões	17
3577	Simplício Mendes	17
3578	Socorro do Piauí	17
3579	Sussuapara	17
3580	Tamboril do Piauí	17
3581	Tanque do Piauí	17
3582	Teresina	17
3583	União	17
3584	Uruçuí	17
3585	Valença do Piauí	17
3586	Várzea Branca	17
3587	Várzea Grande	17
3588	Vera Mendes	17
3589	Vila Nova do Piauí	17
3590	Wall Ferraz	17
3591	Angra dos Reis	19
3592	Aperibé	19
3593	Araruama	19
3594	Areal	19
3595	Armação dos Búzios	19
3596	Arraial do Cabo	19
3597	Barra do Piraí	19
3598	Barra Mansa	19
3599	Belford Roxo	19
3600	Bom Jardim	19
3601	Bom Jesus do Itabapoana	19
3602	Cabo Frio	19
3603	Cachoeiras de Macacu	19
3604	Cambuci	19
3605	Campos dos Goytacazes	19
3606	Cantagalo	19
3607	Carapebus	19
3608	Cardoso Moreira	19
3609	Carmo	19
3610	Casimiro de Abreu	19
3611	Comendador Levy Gasparian	19
3612	Conceição de Macabu	19
3613	Cordeiro	19
3614	Duas Barras	19
3615	Duque de Caxias	19
3616	Engenheiro Paulo de Frontin	19
3617	Guapimirim	19
3618	Iguaba Grande	19
3619	Itaboraí	19
3620	Itaguaí	19
3621	Italva	19
3622	Itaocara	19
3623	Itaperuna	19
3624	Itatiaia	19
3625	Japeri	19
3626	Laje do Muriaé	19
3627	Macaé	19
3628	Macuco	19
3629	Magé	19
3630	Mangaratiba	19
3631	Maricá	19
3632	Mendes	19
3633	Mesquita	19
3634	Miguel Pereira	19
3635	Miracema	19
3636	Natividade	19
3637	Nilópolis	19
3638	Niterói	19
3639	Nova Friburgo	19
3640	Nova Iguaçu	19
3641	Paracambi	19
3642	Paraíba do Sul	19
3643	Parati	19
3644	Paty do Alferes	19
3645	Petrópolis	19
3646	Pinheiral	19
3647	Piraí	19
3648	Porciúncula	19
3649	Porto Real	19
3650	Quatis	19
3651	Queimados	19
3652	Quissamã	19
3653	Resende	19
3654	Rio Bonito	19
3655	Rio Claro	19
3656	Rio das Flores	19
3657	Rio das Ostras	19
3658	Rio de Janeiro	19
3659	Santa Maria Madalena	19
3660	Santo Antônio de Pádua	19
3661	São Fidélis	19
3662	São Francisco de Itabapoana	19
3663	São Gonçalo	19
3664	São João da Barra	19
3665	São João de Meriti	19
3666	São José de Ubá	19
3667	São José do Vale do Rio Pret	19
3668	São Pedro da Aldeia	19
3669	São Sebastião do Alto	19
3670	Sapucaia	19
3671	Saquarema	19
3672	Seropédica	19
3673	Silva Jardim	19
3674	Sumidouro	19
3675	Tanguá	19
3676	Teresópolis	19
3677	Trajano de Morais	19
3678	Três Rios	19
3679	Valença	19
3680	Varre-Sai	19
3681	Vassouras	19
3682	Volta Redonda	19
3683	Acari	20
3684	Açu	20
3685	Afonso Bezerra	20
3686	Água Nova	20
3687	Alexandria	20
3688	Almino Afonso	20
3689	Alto do Rodrigues	20
3690	Angicos	20
3691	Antônio Martins	20
3692	Apodi	20
3693	Areia Branca	20
3694	Arês	20
3695	Augusto Severo	20
3696	Baía Formosa	20
3697	Baraúna	20
3698	Barcelona	20
3699	Bento Fernandes	20
3700	Bodó	20
3701	Bom Jesus	20
3702	Brejinho	20
3703	Caiçara do Norte	20
3704	Caiçara do Rio do Vento	20
3705	Caicó	20
3706	Campo Redondo	20
3707	Canguaretama	20
3708	Caraúbas	20
3709	Carnaúba dos Dantas	20
3710	Carnaubais	20
3711	Ceará-Mirim	20
3712	Cerro Corá	20
3713	Coronel Ezequiel	20
3714	Coronel João Pessoa	20
3715	Cruzeta	20
3716	Currais Novos	20
3717	Doutor Severiano	20
3718	Encanto	20
3719	Equador	20
3720	Espírito Santo	20
3721	Extremoz	20
3722	Felipe Guerra	20
3723	Fernando Pedroza	20
3724	Florânia	20
3725	Francisco Dantas	20
3726	Frutuoso Gomes	20
3727	Galinhos	20
3728	Goianinha	20
3729	Governador Dix-Sept Rosado	20
3730	Grossos	20
3731	Guamaré	20
3732	Ielmo Marinho	20
3733	Ipanguaçu	20
3734	Ipueira	20
3735	Itajá	20
3736	Itaú	20
3737	Jaçanã	20
3738	Jandaíra	20
3739	Janduís	20
3740	Januário Cicco	20
3741	Japi	20
3742	Jardim de Angicos	20
3743	Jardim de Piranhas	20
3744	Jardim do Seridó	20
3745	João Câmara	20
3746	João Dias	20
3747	José da Penha	20
3748	Jucurutu	20
3749	Jundiá	20
3750	Lagoa d"Anta	20
3751	Lagoa de Pedras	20
3752	Lagoa de Velhos	20
3753	Lagoa Nova	20
3754	Lagoa Salgada	20
3755	Lajes	20
3756	Lajes Pintadas	20
3757	Lucrécia	20
3758	Luís Gomes	20
3759	Macaíba	20
3760	Macau	20
3761	Major Sales	20
3762	Marcelino Vieira	20
3763	Martins	20
3764	Maxaranguape	20
3765	Messias Targino	20
3766	Montanhas	20
3767	Monte Alegre	20
3768	Monte das Gameleiras	20
3769	Mossoró	20
3770	Natal	20
3771	Nísia Floresta	20
3772	Nova Cruz	20
3773	Olho-d"Água do Borges	20
3774	Ouro Branco	20
3775	Paraná	20
3776	Paraú	20
3777	Parazinho	20
3778	Parelhas	20
3779	Parnamirim	20
3780	Passa e Fica	20
3781	Passagem	20
3782	Patu	20
3783	Pau dos Ferros	20
3784	Pedra Grande	20
3785	Pedra Preta	20
3786	Pedro Avelino	20
3787	Pedro Velho	20
3788	Pendências	20
3789	Pilões	20
3790	Poço Branco	20
3791	Portalegre	20
3792	Porto do Mangue	20
3793	Presidente Juscelino	20
3794	Pureza	20
3795	Rafael Fernandes	20
3796	Rafael Godeiro	20
3797	Riacho da Cruz	20
3798	Riacho de Santana	20
3799	Riachuelo	20
3800	Rio do Fogo	20
3801	Rodolfo Fernandes	20
3802	Ruy Barbosa	20
3803	Santa Cruz	20
3804	Santa Maria	20
3805	Santana do Matos	20
3806	Santana do Seridó	20
3807	Santo Antônio	20
3808	São Bento do Norte	20
3809	São Bento do Trairí	20
3810	São Fernando	20
3811	São Francisco do Oeste	20
3812	São Gonçalo do Amarante	20
3813	São João do Sabugi	20
3814	São José de Mipibu	20
3815	São José do Campestre	20
3816	São José do Seridó	20
3817	São Miguel	20
3818	São Miguel do Gostoso	20
3819	São Paulo do Potengi	20
3820	São Pedro	20
3821	São Rafael	20
3822	São Tomé	20
3823	São Vicente	20
3824	Senador Elói de Souza	20
3825	Senador Georgino Avelino	20
3826	Serra de São Bento	20
3827	Serra do Mel	20
3828	Serra Negra do Norte	20
3829	Serrinha	20
3830	Serrinha dos Pintos	20
3831	Severiano Melo	20
3832	Sítio Novo	20
3833	Taboleiro Grande	20
3834	Taipu	20
3835	Tangará	20
3836	Tenente Ananias	20
3837	Tenente Laurentino Cruz	20
3838	Tibau	20
3839	Tibau do Sul	20
3840	Timbaúba dos Batistas	20
3841	Touros	20
3842	Triunfo Potiguar	20
3843	Umarizal	20
3844	Upanema	20
3845	Várzea	20
3846	Venha-Ver	20
3847	Vera Cruz	20
3848	Viçosa	20
3849	Vila Flor	20
3850	Aceguá	23
3851	Água Santa	23
3852	Agudo	23
3853	Ajuricaba	23
3854	Alecrim	23
3855	Alegrete	23
3856	Alegria	23
3857	Almirante Tamandaré do Sul	23
3858	Alpestre	23
3859	Alto Alegre	23
3860	Alto Feliz	23
3861	Alvorada	23
3862	Amaral Ferrador	23
3863	Ametista do Sul	23
3864	André da Rocha	23
3865	Anta Gorda	23
3866	Antônio Prado	23
3867	Arambaré	23
3868	Araricá	23
3869	Aratiba	23
3870	Arroio do Meio	23
3871	Arroio do Padre	23
3872	Arroio do Sal	23
3873	Arroio do Tigre	23
3874	Arroio dos Ratos	23
3875	Arroio Grande	23
3876	Arvorezinha	23
3877	Augusto Pestana	23
3878	Áurea	23
3879	Bagé	23
3880	Balneário Pinhal	23
3881	Barão	23
3882	Barão de Cotegipe	23
3883	Barão do Triunfo	23
3884	Barra do Guarita	23
3885	Barra do Quaraí	23
3886	Barra do Ribeiro	23
3887	Barra do Rio Azul	23
3888	Barra Funda	23
3889	Barracão	23
3890	Barros Cassal	23
3891	Benjamin Constant do Sul	23
3892	Bento Gonçalves	23
3893	Boa Vista das Missões	23
3894	Boa Vista do Buricá	23
3895	Boa Vista do Cadeado	23
3896	Boa Vista do Incra	23
3897	Boa Vista do Sul	23
3898	Bom Jesus	23
3899	Bom Princípio	23
3900	Bom Progresso	23
3901	Bom Retiro do Sul	23
3902	Boqueirão do Leão	23
3903	Bossoroca	23
3904	Bozano	23
3905	Braga	23
3906	Brochier	23
3907	Butiá	23
3908	Caçapava do Sul	23
3909	Cacequi	23
3910	Cachoeira do Sul	23
3911	Cachoeirinha	23
3912	Cacique Doble	23
3913	Caibaté	23
3914	Caiçara	23
3915	Camaquã	23
3916	Camargo	23
3917	Cambará do Sul	23
3918	Campestre da Serra	23
3919	Campina das Missões	23
3920	Campinas do Sul	23
3921	Campo Bom	23
3922	Campo Novo	23
3923	Campos Borges	23
3924	Candelária	23
3925	Cândido Godói	23
3926	Candiota	23
3927	Canela	23
3928	Canguçu	23
3929	Canoas	23
3930	Canudos do Vale	23
3931	Capão Bonito do Sul	23
3932	Capão da Canoa	23
3933	Capão do Cipó	23
3934	Capão do Leão	23
3935	Capela de Santana	23
3936	Capitão	23
3937	Capivari do Sul	23
3938	Caraá	23
3939	Carazinho	23
3940	Carlos Barbosa	23
3941	Carlos Gomes	23
3942	Casca	23
3943	Caseiros	23
3944	Catuípe	23
3945	Caxias do Sul	23
3946	Centenário	23
3947	Cerrito	23
3948	Cerro Branco	23
3949	Cerro Grande	23
3950	Cerro Grande do Sul	23
3951	Cerro Largo	23
3952	Chapada	23
3953	Charqueadas	23
3954	Charrua	23
3955	Chiapeta	23
3956	Chuí	23
3957	Chuvisca	23
3958	Cidreira	23
3959	Ciríaco	23
3960	Colinas	23
3961	Colorado	23
3962	Condor	23
3963	Constantina	23
3964	Coqueiro Baixo	23
3965	Coqueiros do Sul	23
3966	Coronel Barros	23
3967	Coronel Bicaco	23
3968	Coronel Pilar	23
3969	Cotiporã	23
3970	Coxilha	23
3971	Crissiumal	23
3972	Cristal	23
3973	Cristal do Sul	23
3974	Cruz Alta	23
3975	Cruzaltense	23
3976	Cruzeiro do Sul	23
3977	David Canabarro	23
3978	Derrubadas	23
3979	Dezesseis de Novembro	23
3980	Dilermando de Aguiar	23
3981	Dois Irmãos	23
3982	Dois Irmãos das Missões	23
3983	Dois Lajeados	23
3984	Dom Feliciano	23
3985	Dom Pedrito	23
3986	Dom Pedro de Alcântara	23
3987	Dona Francisca	23
3988	Doutor Maurício Cardoso	23
3989	Doutor Ricardo	23
3990	Eldorado do Sul	23
3991	Encantado	23
3992	Encruzilhada do Sul	23
3993	Engenho Velho	23
3994	Entre Rios do Sul	23
3995	Entre-Ijuís	23
3996	Erebango	23
3997	Erechim	23
3998	Ernestina	23
3999	Erval Grande	23
4000	Erval Seco	23
4001	Esmeralda	23
4002	Esperança do Sul	23
4003	Espumoso	23
4004	Estação	23
4005	Estância Velha	23
4006	Esteio	23
4007	Estrela	23
4008	Estrela Velha	23
4009	Eugênio de Castro	23
4010	Fagundes Varela	23
4011	Farroupilha	23
4012	Faxinal do Soturno	23
4013	Faxinalzinho	23
4014	Fazenda Vilanova	23
4015	Feliz	23
4016	Flores da Cunha	23
4017	Floriano Peixoto	23
4018	Fontoura Xavier	23
4019	Formigueiro	23
4020	Forquetinha	23
4021	Fortaleza dos Valos	23
4022	Frederico Westphalen	23
4023	Garibaldi	23
4024	Garruchos	23
4025	Gaurama	23
4026	General Câmara	23
4027	Gentil	23
4028	Getúlio Vargas	23
4029	Giruá	23
4030	Glorinha	23
4031	Gramado	23
4032	Gramado dos Loureiros	23
4033	Gramado Xavier	23
4034	Gravataí	23
4035	Guabiju	23
4036	Guaíba	23
4037	Guaporé	23
4038	Guarani das Missões	23
4039	Harmonia	23
4040	Herval	23
4041	Herveiras	23
4042	Horizontina	23
4043	Hulha Negra	23
4044	Humaitá	23
4045	Ibarama	23
4046	Ibiaçá	23
4047	Ibiraiaras	23
4048	Ibirapuitã	23
4049	Ibirubá	23
4050	Igrejinha	23
4051	Ijuí	23
4052	Ilópolis	23
4053	Imbé	23
4054	Imigrante	23
4055	Independência	23
4056	Inhacorá	23
4057	Ipê	23
4058	Ipiranga do Sul	23
4059	Iraí	23
4060	Itaara	23
4061	Itacurubi	23
4062	Itapuca	23
4063	Itaqui	23
4064	Itati	23
4065	Itatiba do Sul	23
4066	Ivorá	23
4067	Ivoti	23
4068	Jaboticaba	23
4069	Jacuizinho	23
4070	Jacutinga	23
4071	Jaguarão	23
4072	Jaguari	23
4073	Jaquirana	23
4074	Jari	23
4075	Jóia	23
4076	Júlio de Castilhos	23
4077	Lagoa Bonita do Sul	23
4078	Lagoa dos Três Cantos	23
4079	Lagoa Vermelha	23
4080	Lagoão	23
4081	Lajeado	23
4082	Lajeado do Bugre	23
4083	Lavras do Sul	23
4084	Liberato Salzano	23
4085	Lindolfo Collor	23
4086	Linha Nova	23
4087	Maçambara	23
4088	Machadinho	23
4089	Mampituba	23
4090	Manoel Viana	23
4091	Maquiné	23
4092	Maratá	23
4093	Marau	23
4094	Marcelino Ramos	23
4095	Mariana Pimentel	23
4096	Mariano Moro	23
4097	Marques de Souza	23
4098	Mata	23
4099	Mato Castelhano	23
4100	Mato Leitão	23
4101	Mato Queimado	23
4102	Maximiliano de Almeida	23
4103	Minas do Leão	23
4104	Miraguaí	23
4105	Montauri	23
4106	Monte Alegre dos Campos	23
4107	Monte Belo do Sul	23
4108	Montenegro	23
4109	Mormaço	23
4110	Morrinhos do Sul	23
4111	Morro Redondo	23
4112	Morro Reuter	23
4113	Mostardas	23
4114	Muçum	23
4115	Muitos Capões	23
4116	Muliterno	23
4117	Não-Me-Toque	23
4118	Nicolau Vergueiro	23
4119	Nonoai	23
4120	Nova Alvorada	23
4121	Nova Araçá	23
4122	Nova Bassano	23
4123	Nova Boa Vista	23
4124	Nova Bréscia	23
4125	Nova Candelária	23
4126	Nova Esperança do Sul	23
4127	Nova Hartz	23
4128	Nova Pádua	23
4129	Nova Palma	23
4130	Nova Petrópolis	23
4131	Nova Prata	23
4132	Nova Ramada	23
4133	Nova Roma do Sul	23
4134	Nova Santa Rita	23
4135	Novo Barreiro	23
4136	Novo Cabrais	23
4137	Novo Hamburgo	23
4138	Novo Machado	23
4139	Novo Tiradentes	23
4140	Novo Xingu	23
4141	Osório	23
4142	Paim Filho	23
4143	Palmares do Sul	23
4144	Palmeira das Missões	23
4145	Palmitinho	23
4146	Panambi	23
4147	Pantano Grande	23
4148	Paraí	23
4149	Paraíso do Sul	23
4150	Pareci Novo	23
4151	Parobé	23
4152	Passa Sete	23
4153	Passo do Sobrado	23
4154	Passo Fundo	23
4155	Paulo Bento	23
4156	Paverama	23
4157	Pedras Altas	23
4158	Pedro Osório	23
4159	Pejuçara	23
4160	Pelotas	23
4161	Picada Café	23
4162	Pinhal	23
4163	Pinhal da Serra	23
4164	Pinhal Grande	23
4165	Pinheirinho do Vale	23
4166	Pinheiro Machado	23
4167	Pirapó	23
4168	Piratini	23
4169	Planalto	23
4170	Poço das Antas	23
4171	Pontão	23
4172	Ponte Preta	23
4173	Portão	23
4174	Porto Alegre	23
4175	Porto Lucena	23
4176	Porto Mauá	23
4177	Porto Vera Cruz	23
4178	Porto Xavier	23
4179	Pouso Novo	23
4180	Presidente Lucena	23
4181	Progresso	23
4182	Protásio Alves	23
4183	Putinga	23
4184	Quaraí	23
4185	Quatro Irmãos	23
4186	Quevedos	23
4187	Quinze de Novembro	23
4188	Redentora	23
4189	Relvado	23
4190	Restinga Seca	23
4191	Rio dos Índios	23
4192	Rio Grande	23
4193	Rio Pardo	23
4194	Riozinho	23
4195	Roca Sales	23
4196	Rodeio Bonito	23
4197	Rolador	23
4198	Rolante	23
4199	Ronda Alta	23
4200	Rondinha	23
4201	Roque Gonzales	23
4202	Rosário do Sul	23
4203	Sagrada Família	23
4204	Saldanha Marinho	23
4205	Salto do Jacuí	23
4206	Salvador das Missões	23
4207	Salvador do Sul	23
4208	Sananduva	23
4209	Santa Bárbara do Sul	23
4210	Santa Cecília do Sul	23
4211	Santa Clara do Sul	23
4212	Santa Cruz do Sul	23
4213	Santa Margarida do Sul	23
4214	Santa Maria	23
4215	Santa Maria do Herval	23
4216	Santa Rosa	23
4217	Santa Tereza	23
4218	Santa Vitória do Palmar	23
4219	Santana da Boa Vista	23
4220	Santana do Livramento	23
4221	Santiago	23
4222	Santo Ângelo	23
4223	Santo Antônio da Patrulha	23
4224	Santo Antônio das Missões	23
4225	Santo Antônio do Palma	23
4226	Santo Antônio do Planalto	23
4227	Santo Augusto	23
4228	Santo Cristo	23
4229	Santo Expedito do Sul	23
4230	São Borja	23
4231	São Domingos do Sul	23
4232	São Francisco de Assis	23
4233	São Francisco de Paula	23
4234	São Gabriel	23
4235	São Jerônimo	23
4236	São João da Urtiga	23
4237	São João do Polêsine	23
4238	São Jorge	23
4239	São José das Missões	23
4240	São José do Herval	23
4241	São José do Hortêncio	23
4242	São José do Inhacorá	23
4243	São José do Norte	23
4244	São José do Ouro	23
4245	São José do Sul	23
4246	São José dos Ausentes	23
4247	São Leopoldo	23
4248	São Lourenço do Sul	23
4249	São Luiz Gonzaga	23
4250	São Marcos	23
4251	São Martinho	23
4252	São Martinho da Serra	23
4253	São Miguel das Missões	23
4254	São Nicolau	23
4255	São Paulo das Missões	23
4256	São Pedro da Serra	23
4257	São Pedro das Missões	23
4258	São Pedro do Butiá	23
4259	São Pedro do Sul	23
4260	São Sebastião do Caí	23
4261	São Sepé	23
4262	São Valentim	23
4263	São Valentim do Sul	23
4264	São Valério do Sul	23
4265	São Vendelino	23
4266	São Vicente do Sul	23
4267	Sapiranga	23
4268	Sapucaia do Sul	23
4269	Sarandi	23
4270	Seberi	23
4271	Sede Nova	23
4272	Segredo	23
4273	Selbach	23
4274	Senador Salgado Filho	23
4275	Sentinela do Sul	23
4276	Serafina Corrêa	23
4277	Sério	23
4278	Sertão	23
4279	Sertão Santana	23
4280	Sete de Setembro	23
4281	Severiano de Almeida	23
4282	Silveira Martins	23
4283	Sinimbu	23
4284	Sobradinho	23
4285	Soledade	23
4286	Tabaí	23
4287	Tapejara	23
4288	Tapera	23
4289	Tapes	23
4290	Taquara	23
4291	Taquari	23
4292	Taquaruçu do Sul	23
4293	Tavares	23
4294	Tenente Portela	23
4295	Terra de Areia	23
4296	Teutônia	23
4297	Tio Hugo	23
4298	Tiradentes do Sul	23
4299	Toropi	23
4300	Torres	23
4301	Tramandaí	23
4302	Travesseiro	23
4303	Três Arroios	23
4304	Três Cachoeiras	23
4305	Três Coroas	23
4306	Três de Maio	23
4307	Três Forquilhas	23
4308	Três Palmeiras	23
4309	Três Passos	23
4310	Trindade do Sul	23
4311	Triunfo	23
4312	Tucunduva	23
4313	Tunas	23
4314	Tupanci do Sul	23
4315	Tupanciretã	23
4316	Tupandi	23
4317	Tuparendi	23
4318	Turuçu	23
4319	Ubiretama	23
4320	União da Serra	23
4321	Unistalda	23
4322	Uruguaiana	23
4323	Vacaria	23
4324	Vale do Sol	23
4325	Vale Real	23
4326	Vale Verde	23
4327	Vanini	23
4328	Venâncio Aires	23
4329	Vera Cruz	23
4330	Veranópolis	23
4331	Vespasiano Correa	23
4332	Viadutos	23
4333	Viamão	23
4334	Vicente Dutra	23
4335	Victor Graeff	23
4336	Vila Flores	23
4337	Vila Lângaro	23
4338	Vila Maria	23
4339	Vila Nova do Sul	23
4340	Vista Alegre	23
4341	Vista Alegre do Prata	23
4342	Vista Gaúcha	23
4343	Vitória das Missões	23
4344	Westfália	23
4345	Xangri-lá	23
4346	Alta Floresta d"Oeste	21
4347	Alto Alegre dos Parecis	21
4348	Alto Paraíso	21
4349	Alvorada d"Oeste	21
4350	Ariquemes	21
4351	Buritis	21
4352	Cabixi	21
4353	Cacaulândia	21
4354	Cacoal	21
4355	Campo Novo de Rondônia	21
4356	Candeias do Jamari	21
4357	Castanheiras	21
4358	Cerejeiras	21
4359	Chupinguaia	21
4360	Colorado do Oeste	21
4361	Corumbiara	21
4362	Costa Marques	21
4363	Cujubim	21
4364	Espigão d"Oeste	21
4365	Governador Jorge Teixeira	21
4366	Guajará-Mirim	21
4367	Itapuã do Oeste	21
4368	Jaru	21
4369	Ji-Paraná	21
4370	Machadinho d"Oeste	21
4371	Ministro Andreazza	21
4372	Mirante da Serra	21
4373	Monte Negro	21
4374	Nova Brasilândia d"Oeste	21
4375	Nova Mamoré	21
4376	Nova União	21
4377	Novo Horizonte do Oeste	21
4378	Ouro Preto do Oeste	21
4379	Parecis	21
4380	Pimenta Bueno	21
4381	Pimenteiras do Oeste	21
4382	Porto Velho	21
4383	Presidente Médici	21
4384	Primavera de Rondônia	21
4385	Rio Crespo	21
4386	Rolim de Moura	21
4387	Santa Luzia d"Oeste	21
4388	São Felipe d"Oeste	21
4389	São Francisco do Guaporé	21
4390	São Miguel do Guaporé	21
4391	Seringueiras	21
4392	Teixeirópolis	21
4393	Theobroma	21
4394	Urupá	21
4395	Vale do Anari	21
4396	Vale do Paraíso	21
4397	Vilhena	21
4398	Alto Alegre	22
4399	Amajari	22
4400	Boa Vista	22
4401	Bonfim	22
4402	Cantá	22
4403	Caracaraí	22
4404	Caroebe	22
4405	Iracema	22
4406	Mucajaí	22
4407	Normandia	22
4408	Pacaraima	22
4409	Rorainópolis	22
4410	São João da Baliza	22
4411	São Luiz	22
4412	Uiramutã	22
4413	Abdon Batista	24
4414	Abelardo Luz	24
4415	Agrolândia	24
4416	Agronômica	24
4417	Água Doce	24
4418	Águas de Chapecó	24
4419	Águas Frias	24
4420	Águas Mornas	24
4421	Alfredo Wagner	24
4422	Alto Bela Vista	24
4423	Anchieta	24
4424	Angelina	24
4425	Anita Garibaldi	24
4426	Anitápolis	24
4427	Antônio Carlos	24
4428	Apiúna	24
4429	Arabutã	24
4430	Araquari	24
4431	Araranguá	24
4432	Armazém	24
4433	Arroio Trinta	24
4434	Arvoredo	24
4435	Ascurra	24
4436	Atalanta	24
4437	Aurora	24
4438	Balneário Arroio do Silva	24
4439	Balneário Barra do Sul	24
4440	Balneário Camboriú	24
4441	Balneário Gaivota	24
4442	Bandeirante	24
4443	Barra Bonita	24
4444	Barra Velha	24
4445	Bela Vista do Toldo	24
4446	Belmonte	24
4447	Benedito Novo	24
4448	Biguaçu	24
4449	Blumenau	24
4450	Bocaina do Sul	24
4451	Bom Jardim da Serra	24
4452	Bom Jesus	24
4453	Bom Jesus do Oeste	24
4454	Bom Retiro	24
4455	Bombinhas	24
4456	Botuverá	24
4457	Braço do Norte	24
4458	Braço do Trombudo	24
4459	Brunópolis	24
4460	Brusque	24
4461	Caçador	24
4462	Caibi	24
4463	Calmon	24
4464	Camboriú	24
4465	Campo Alegre	24
4466	Campo Belo do Sul	24
4467	Campo Erê	24
4468	Campos Novos	24
4469	Canelinha	24
4470	Canoinhas	24
4471	Capão Alto	24
4472	Capinzal	24
4473	Capivari de Baixo	24
4474	Catanduvas	24
4475	Caxambu do Sul	24
4476	Celso Ramos	24
4477	Cerro Negro	24
4478	Chapadão do Lageado	24
4479	Chapecó	24
4480	Cocal do Sul	24
4481	Concórdia	24
4482	Cordilheira Alta	24
4483	Coronel Freitas	24
4484	Coronel Martins	24
4485	Correia Pinto	24
4486	Corupá	24
4487	Criciúma	24
4488	Cunha Porã	24
4489	Cunhataí	24
4490	Curitibanos	24
4491	Descanso	24
4492	Dionísio Cerqueira	24
4493	Dona Emma	24
4494	Doutor Pedrinho	24
4495	Entre Rios	24
4496	Ermo	24
4497	Erval Velho	24
4498	Faxinal dos Guedes	24
4499	Flor do Sertão	24
4500	Florianópolis	24
4501	Formosa do Sul	24
4502	Forquilhinha	24
4503	Fraiburgo	24
4504	Frei Rogério	24
4505	Galvão	24
4506	Garopaba	24
4507	Garuva	24
4508	Gaspar	24
4509	Governador Celso Ramos	24
4510	Grão Pará	24
4511	Gravatal	24
4512	Guabiruba	24
4513	Guaraciaba	24
4514	Guaramirim	24
4515	Guarujá do Sul	24
4516	Guatambú	24
4517	Herval d"Oeste	24
4518	Ibiam	24
4519	Ibicaré	24
4520	Ibirama	24
4521	Içara	24
4522	Ilhota	24
4523	Imaruí	24
4524	Imbituba	24
4525	Imbuia	24
4526	Indaial	24
4527	Iomerê	24
4528	Ipira	24
4529	Iporã do Oeste	24
4530	Ipuaçu	24
4531	Ipumirim	24
4532	Iraceminha	24
4533	Irani	24
4534	Irati	24
4535	Irineópolis	24
4536	Itá	24
4537	Itaiópolis	24
4538	Itajaí	24
4539	Itapema	24
4540	Itapiranga	24
4541	Itapoá	24
4542	Ituporanga	24
4543	Jaborá	24
4544	Jacinto Machado	24
4545	Jaguaruna	24
4546	Jaraguá do Sul	24
4547	Jardinópolis	24
4548	Joaçaba	24
4549	Joinville	24
4550	José Boiteux	24
4551	Jupiá	24
4552	Lacerdópolis	24
4553	Lages	24
4554	Laguna	24
4555	Lajeado Grande	24
4556	Laurentino	24
4557	Lauro Muller	24
4558	Lebon Régis	24
4559	Leoberto Leal	24
4560	Lindóia do Sul	24
4561	Lontras	24
4562	Luiz Alves	24
4563	Luzerna	24
4564	Macieira	24
4565	Mafra	24
4566	Major Gercino	24
4567	Major Vieira	24
4568	Maracajá	24
4569	Maravilha	24
4570	Marema	24
4571	Massaranduba	24
4572	Matos Costa	24
4573	Meleiro	24
4574	Mirim Doce	24
4575	Modelo	24
4576	Mondaí	24
4577	Monte Carlo	24
4578	Monte Castelo	24
4579	Morro da Fumaça	24
4580	Morro Grande	24
4581	Navegantes	24
4582	Nova Erechim	24
4583	Nova Itaberaba	24
4584	Nova Trento	24
4585	Nova Veneza	24
4586	Novo Horizonte	24
4587	Orleans	24
4588	Otacílio Costa	24
4589	Ouro	24
4590	Ouro Verde	24
4591	Paial	24
4592	Painel	24
4593	Palhoça	24
4594	Palma Sola	24
4595	Palmeira	24
4596	Palmitos	24
4597	Papanduva	24
4598	Paraíso	24
4599	Passo de Torres	24
4600	Passos Maia	24
4601	Paulo Lopes	24
4602	Pedras Grandes	24
4603	Penha	24
4604	Peritiba	24
4605	Petrolândia	24
4606	Piçarras	24
4607	Pinhalzinho	24
4608	Pinheiro Preto	24
4609	Piratuba	24
4610	Planalto Alegre	24
4611	Pomerode	24
4612	Ponte Alta	24
4613	Ponte Alta do Norte	24
4614	Ponte Serrada	24
4615	Porto Belo	24
4616	Porto União	24
4617	Pouso Redondo	24
4618	Praia Grande	24
4619	Presidente Castelo Branco	24
4620	Presidente Getúlio	24
4621	Presidente Nereu	24
4622	Princesa	24
4623	Quilombo	24
4624	Rancho Queimado	24
4625	Rio das Antas	24
4626	Rio do Campo	24
4627	Rio do Oeste	24
4628	Rio do Sul	24
4629	Rio dos Cedros	24
4630	Rio Fortuna	24
4631	Rio Negrinho	24
4632	Rio Rufino	24
4633	Riqueza	24
4634	Rodeio	24
4635	Romelândia	24
4636	Salete	24
4637	Saltinho	24
4638	Salto Veloso	24
4639	Sangão	24
4640	Santa Cecília	24
4641	Santa Helena	24
4642	Santa Rosa de Lima	24
4643	Santa Rosa do Sul	24
4644	Santa Terezinha	24
4645	Santa Terezinha do Progresso	24
4646	Santiago do Sul	24
4647	Santo Amaro da Imperatriz	24
4648	São Bento do Sul	24
4649	São Bernardino	24
4650	São Bonifácio	24
4651	São Carlos	24
4652	São Cristovão do Sul	24
4653	São Domingos	24
4654	São Francisco do Sul	24
4655	São João Batista	24
4656	São João do Itaperiú	24
4657	São João do Oeste	24
4658	São João do Sul	24
4659	São Joaquim	24
4660	São José	24
4661	São José do Cedro	24
4662	São José do Cerrito	24
4663	São Lourenço do Oeste	24
4664	São Ludgero	24
4665	São Martinho	24
4666	São Miguel da Boa Vista	24
4667	São Miguel do Oeste	24
4668	São Pedro de Alcântara	24
4669	Saudades	24
4670	Schroeder	24
4671	Seara	24
4672	Serra Alta	24
4673	Siderópolis	24
4674	Sombrio	24
4675	Sul Brasil	24
4676	Taió	24
4677	Tangará	24
4678	Tigrinhos	24
4679	Tijucas	24
4680	Timbé do Sul	24
4681	Timbó	24
4682	Timbó Grande	24
4683	Três Barras	24
4684	Treviso	24
4685	Treze de Maio	24
4686	Treze Tílias	24
4687	Trombudo Central	24
4688	Tubarão	24
4689	Tunápolis	24
4690	Turvo	24
4691	União do Oeste	24
4692	Urubici	24
4693	Urupema	24
4694	Urussanga	24
4695	Vargeão	24
4696	Vargem	24
4697	Vargem Bonita	24
4698	Vidal Ramos	24
4699	Videira	24
4700	Vitor Meireles	24
4701	Witmarsum	24
4702	Xanxerê	24
4703	Xavantina	24
4704	Xaxim	24
4705	Zortéa	24
4706	Adamantina	26
4707	Adolfo	26
4708	Aguaí	26
4709	Águas da Prata	26
4710	Águas de Lindóia	26
4711	Águas de Santa Bárbara	26
4712	Águas de São Pedro	26
4713	Agudos	26
4714	Alambari	26
4715	Alfredo Marcondes	26
4716	Altair	26
4717	Altinópolis	26
4718	Alto Alegre	26
4719	Alumínio	26
4720	Álvares Florence	26
4721	Álvares Machado	26
4722	Álvaro de Carvalho	26
4723	Alvinlândia	26
4724	Americana	26
4725	Américo Brasiliense	26
4726	Américo de Campos	26
4727	Amparo	26
4728	Analândia	26
4729	Andradina	26
4730	Angatuba	26
4731	Anhembi	26
4732	Anhumas	26
4733	Aparecida	26
4734	Aparecida d"Oeste	26
4735	Apiaí	26
4736	Araçariguama	26
4737	Araçatuba	26
4738	Araçoiaba da Serra	26
4739	Aramina	26
4740	Arandu	26
4741	Arapeí	26
4742	Araraquara	26
4743	Araras	26
4744	Arco-Íris	26
4745	Arealva	26
4746	Areias	26
4747	Areiópolis	26
4748	Ariranha	26
4749	Artur Nogueira	26
4750	Arujá	26
4751	Aspásia	26
4752	Assis	26
4753	Atibaia	26
4754	Auriflama	26
4755	Avaí	26
4756	Avanhandava	26
4757	Avaré	26
4758	Bady Bassitt	26
4759	Balbinos	26
4760	Bálsamo	26
4761	Bananal	26
4762	Barão de Antonina	26
4763	Barbosa	26
4764	Bariri	26
4765	Barra Bonita	26
4766	Barra do Chapéu	26
4767	Barra do Turvo	26
4768	Barretos	26
4769	Barrinha	26
4770	Barueri	26
4771	Bastos	26
4772	Batatais	26
4773	Bauru	26
4774	Bebedouro	26
4775	Bento de Abreu	26
4776	Bernardino de Campos	26
4777	Bertioga	26
4778	Bilac	26
4779	Birigui	26
4780	Biritiba-Mirim	26
4781	Boa Esperança do Sul	26
4782	Bocaina	26
4783	Bofete	26
4784	Boituva	26
4785	Bom Jesus dos Perdões	26
4786	Bom Sucesso de Itararé	26
4787	Borá	26
4788	Boracéia	26
4789	Borborema	26
4790	Borebi	26
4791	Botucatu	26
4792	Bragança Paulista	26
4793	Braúna	26
4794	Brejo Alegre	26
4795	Brodowski	26
4796	Brotas	26
4797	Buri	26
4798	Buritama	26
4799	Buritizal	26
4800	Cabrália Paulista	26
4801	Cabreúva	26
4802	Caçapava	26
4803	Cachoeira Paulista	26
4804	Caconde	26
4805	Cafelândia	26
4806	Caiabu	26
4807	Caieiras	26
4808	Caiuá	26
4809	Cajamar	26
4810	Cajati	26
4811	Cajobi	26
4812	Cajuru	26
4813	Campina do Monte Alegre	26
4814	Campinas	26
4815	Campo Limpo Paulista	26
4816	Campos do Jordão	26
4817	Campos Novos Paulista	26
4818	Cananéia	26
4819	Canas	26
4820	Cândido Mota	26
4821	Cândido Rodrigues	26
4822	Canitar	26
4823	Capão Bonito	26
4824	Capela do Alto	26
4825	Capivari	26
4826	Caraguatatuba	26
4827	Carapicuíba	26
4828	Cardoso	26
4829	Casa Branca	26
4830	Cássia dos Coqueiros	26
4831	Castilho	26
4832	Catanduva	26
4833	Catiguá	26
4834	Cedral	26
4835	Cerqueira César	26
4836	Cerquilho	26
4837	Cesário Lange	26
4838	Charqueada	26
4839	Chavantes	26
4840	Clementina	26
4841	Colina	26
4842	Colômbia	26
4843	Conchal	26
4844	Conchas	26
4845	Cordeirópolis	26
4846	Coroados	26
4847	Coronel Macedo	26
4848	Corumbataí	26
4849	Cosmópolis	26
4850	Cosmorama	26
4851	Cotia	26
4852	Cravinhos	26
4853	Cristais Paulista	26
4854	Cruzália	26
4855	Cruzeiro	26
4856	Cubatão	26
4857	Cunha	26
4858	Descalvado	26
4859	Diadema	26
4860	Dirce Reis	26
4861	Divinolândia	26
4862	Dobrada	26
4863	Dois Córregos	26
4864	Dolcinópolis	26
4865	Dourado	26
4866	Dracena	26
4867	Duartina	26
4868	Dumont	26
4869	Echaporã	26
4870	Eldorado	26
4871	Elias Fausto	26
4872	Elisiário	26
4873	Embaúba	26
4874	Embu	26
4875	Embu-Guaçu	26
4876	Emilianópolis	26
4877	Engenheiro Coelho	26
4878	Espírito Santo do Pinhal	26
4879	Espírito Santo do Turvo	26
4880	Estiva Gerbi	26
4881	Estrela d"Oeste	26
4882	Estrela do Norte	26
4883	Euclides da Cunha Paulista	26
4884	Fartura	26
4885	Fernando Prestes	26
4886	Fernandópolis	26
4887	Fernão	26
4888	Ferraz de Vasconcelos	26
4889	Flora Rica	26
4890	Floreal	26
4891	Flórida Paulista	26
4892	Florínia	26
4893	Franca	26
4894	Francisco Morato	26
4895	Franco da Rocha	26
4896	Gabriel Monteiro	26
4897	Gália	26
4898	Garça	26
4899	Gastão Vidigal	26
4900	Gavião Peixoto	26
4901	General Salgado	26
4902	Getulina	26
4903	Glicério	26
4904	Guaiçara	26
4905	Guaimbê	26
4906	Guaíra	26
4907	Guapiaçu	26
4908	Guapiara	26
4909	Guará	26
4910	Guaraçaí	26
4911	Guaraci	26
4912	Guarani d"Oeste	26
4913	Guarantã	26
4914	Guararapes	26
4915	Guararema	26
4916	Guaratinguetá	26
4917	Guareí	26
4918	Guariba	26
4919	Guarujá	26
4920	Guarulhos	26
4921	Guatapará	26
4922	Guzolândia	26
4923	Herculândia	26
4924	Holambra	26
4925	Hortolândia	26
4926	Iacanga	26
4927	Iacri	26
4928	Iaras	26
4929	Ibaté	26
4930	Ibirá	26
4931	Ibirarema	26
4932	Ibitinga	26
4933	Ibiúna	26
4934	Icém	26
4935	Iepê	26
4936	Igaraçu do Tietê	26
4937	Igarapava	26
4938	Igaratá	26
4939	Iguape	26
4940	Ilha Comprida	26
4941	Ilha Solteira	26
4942	Ilhabela	26
4943	Indaiatuba	26
4944	Indiana	26
4945	Indiaporã	26
4946	Inúbia Paulista	26
4947	Ipaussu	26
4948	Iperó	26
4949	Ipeúna	26
4950	Ipiguá	26
4951	Iporanga	26
4952	Ipuã	26
4953	Iracemápolis	26
4954	Irapuã	26
4955	Irapuru	26
4956	Itaberá	26
4957	Itaí	26
4958	Itajobi	26
4959	Itaju	26
4960	Itanhaém	26
4961	Itaóca	26
4962	Itapecerica da Serra	26
4963	Itapetininga	26
4964	Itapeva	26
4965	Itapevi	26
4966	Itapira	26
4967	Itapirapuã Paulista	26
4968	Itápolis	26
4969	Itaporanga	26
4970	Itapuí	26
4971	Itapura	26
4972	Itaquaquecetuba	26
4973	Itararé	26
4974	Itariri	26
4975	Itatiba	26
4976	Itatinga	26
4977	Itirapina	26
4978	Itirapuã	26
4979	Itobi	26
4980	Itu	26
4981	Itupeva	26
4982	Ituverava	26
4983	Jaborandi	26
4984	Jaboticabal	26
4985	Jacareí	26
4986	Jaci	26
4987	Jacupiranga	26
4988	Jaguariúna	26
4989	Jales	26
4990	Jambeiro	26
4991	Jandira	26
4992	Jardinópolis	26
4993	Jarinu	26
4994	Jaú	26
4995	Jeriquara	26
4996	Joanópolis	26
4997	João Ramalho	26
4998	José Bonifácio	26
4999	Júlio Mesquita	26
5000	Jumirim	26
5001	Jundiaí	26
5002	Junqueirópolis	26
5003	Juquiá	26
5004	Juquitiba	26
5005	Lagoinha	26
5006	Laranjal Paulista	26
5007	Lavínia	26
5008	Lavrinhas	26
5009	Leme	26
5010	Lençóis Paulista	26
5011	Limeira	26
5012	Lindóia	26
5013	Lins	26
5014	Lorena	26
5015	Lourdes	26
5016	Louveira	26
5017	Lucélia	26
5018	Lucianópolis	26
5019	Luís Antônio	26
5020	Luiziânia	26
5021	Lupércio	26
5022	Lutécia	26
5023	Macatuba	26
5024	Macaubal	26
5025	Macedônia	26
5026	Magda	26
5027	Mairinque	26
5028	Mairiporã	26
5029	Manduri	26
5030	Marabá Paulista	26
5031	Maracaí	26
5032	Marapoama	26
5033	Mariápolis	26
5034	Marília	26
5035	Marinópolis	26
5036	Martinópolis	26
5037	Matão	26
5038	Mauá	26
5039	Mendonça	26
5040	Meridiano	26
5041	Mesópolis	26
5042	Miguelópolis	26
5043	Mineiros do Tietê	26
5044	Mira Estrela	26
5045	Miracatu	26
5046	Mirandópolis	26
5047	Mirante do Paranapanema	26
5048	Mirassol	26
5049	Mirassolândia	26
5050	Mococa	26
5051	Mogi das Cruzes	26
5052	Mogi Guaçu	26
5053	Moji Mirim	26
5054	Mombuca	26
5055	Monções	26
5056	Mongaguá	26
5057	Monte Alegre do Sul	26
5058	Monte Alto	26
5059	Monte Aprazível	26
5060	Monte Azul Paulista	26
5061	Monte Castelo	26
5062	Monte Mor	26
5063	Monteiro Lobato	26
5064	Morro Agudo	26
5065	Morungaba	26
5066	Motuca	26
5067	Murutinga do Sul	26
5068	Nantes	26
5069	Narandiba	26
5070	Natividade da Serra	26
5071	Nazaré Paulista	26
5072	Neves Paulista	26
5073	Nhandeara	26
5074	Nipoã	26
5075	Nova Aliança	26
5076	Nova Campina	26
5077	Nova Canaã Paulista	26
5078	Nova Castilho	26
5079	Nova Europa	26
5080	Nova Granada	26
5081	Nova Guataporanga	26
5082	Nova Independência	26
5083	Nova Luzitânia	26
5084	Nova Odessa	26
5085	Novais	26
5086	Novo Horizonte	26
5087	Nuporanga	26
5088	Ocauçu	26
5089	Óleo	26
5090	Olímpia	26
5091	Onda Verde	26
5092	Oriente	26
5093	Orindiúva	26
5094	Orlândia	26
5095	Osasco	26
5096	Oscar Bressane	26
5097	Osvaldo Cruz	26
5098	Ourinhos	26
5099	Ouro Verde	26
5100	Ouroeste	26
5101	Pacaembu	26
5102	Palestina	26
5103	Palmares Paulista	26
5104	Palmeira d"Oeste	26
5105	Palmital	26
5106	Panorama	26
5107	Paraguaçu Paulista	26
5108	Paraibuna	26
5109	Paraíso	26
5110	Paranapanema	26
5111	Paranapuã	26
5112	Parapuã	26
5113	Pardinho	26
5114	Pariquera-Açu	26
5115	Parisi	26
5116	Patrocínio Paulista	26
5117	Paulicéia	26
5118	Paulínia	26
5119	Paulistânia	26
5120	Paulo de Faria	26
5121	Pederneiras	26
5122	Pedra Bela	26
5123	Pedranópolis	26
5124	Pedregulho	26
5125	Pedreira	26
5126	Pedrinhas Paulista	26
5127	Pedro de Toledo	26
5128	Penápolis	26
5129	Pereira Barreto	26
5130	Pereiras	26
5131	Peruíbe	26
5132	Piacatu	26
5133	Piedade	26
5134	Pilar do Sul	26
5135	Pindamonhangaba	26
5136	Pindorama	26
5137	Pinhalzinho	26
5138	Piquerobi	26
5139	Piquete	26
5140	Piracaia	26
5141	Piracicaba	26
5142	Piraju	26
5143	Pirajuí	26
5144	Pirangi	26
5145	Pirapora do Bom Jesus	26
5146	Pirapozinho	26
5147	Pirassununga	26
5148	Piratininga	26
5149	Pitangueiras	26
5150	Planalto	26
5151	Platina	26
5152	Poá	26
5153	Poloni	26
5154	Pompéia	26
5155	Pongaí	26
5156	Pontal	26
5157	Pontalinda	26
5158	Pontes Gestal	26
5159	Populina	26
5160	Porangaba	26
5161	Porto Feliz	26
5162	Porto Ferreira	26
5163	Potim	26
5164	Potirendaba	26
5165	Pracinha	26
5166	Pradópolis	26
5167	Praia Grande	26
5168	Pratânia	26
5169	Presidente Alves	26
5170	Presidente Bernardes	26
5171	Presidente Epitácio	26
5172	Presidente Prudente	26
5173	Presidente Venceslau	26
5174	Promissão	26
5175	Quadra	26
5176	Quatá	26
5177	Queiroz	26
5178	Queluz	26
5179	Quintana	26
5180	Rafard	26
5181	Rancharia	26
5182	Redenção da Serra	26
5183	Regente Feijó	26
5184	Reginópolis	26
5185	Registro	26
5186	Restinga	26
5187	Ribeira	26
5188	Ribeirão Bonito	26
5189	Ribeirão Branco	26
5190	Ribeirão Corrente	26
5191	Ribeirão do Sul	26
5192	Ribeirão dos Índios	26
5193	Ribeirão Grande	26
5194	Ribeirão Pires	26
5195	Ribeirão Preto	26
5196	Rifaina	26
5197	Rincão	26
5198	Rinópolis	26
5199	Rio Claro	26
5200	Rio das Pedras	26
5201	Rio Grande da Serra	26
5202	Riolândia	26
5203	Riversul	26
5204	Rosana	26
5205	Roseira	26
5206	Rubiácea	26
5207	Rubinéia	26
5208	Sabino	26
5209	Sagres	26
5210	Sales	26
5211	Sales Oliveira	26
5212	Salesópolis	26
5213	Salmourão	26
5214	Saltinho	26
5215	Salto	26
5216	Salto de Pirapora	26
5217	Salto Grande	26
5218	Sandovalina	26
5219	Santa Adélia	26
5220	Santa Albertina	26
5221	Santa Bárbara d"Oeste	26
5222	Santa Branca	26
5223	Santa Clara d"Oeste	26
5224	Santa Cruz da Conceição	26
5225	Santa Cruz da Esperança	26
5226	Santa Cruz das Palmeiras	26
5227	Santa Cruz do Rio Pardo	26
5228	Santa Ernestina	26
5229	Santa Fé do Sul	26
5230	Santa Gertrudes	26
5231	Santa Isabel	26
5232	Santa Lúcia	26
5233	Santa Maria da Serra	26
5234	Santa Mercedes	26
5235	Santa Rita d"Oeste	26
5236	Santa Rita do Passa Quatro	26
5237	Santa Rosa de Viterbo	26
5238	Santa Salete	26
5239	Santana da Ponte Pensa	26
5240	Santana de Parnaíba	26
5241	Santo Anastácio	26
5242	Santo André	26
5243	Santo Antônio da Alegria	26
5244	Santo Antônio de Posse	26
5245	Santo Antônio do Aracanguá	26
5246	Santo Antônio do Jardim	26
5247	Santo Antônio do Pinhal	26
5248	Santo Expedito	26
5249	Santópolis do Aguapeí	26
5250	Santos	26
5251	São Bento do Sapucaí	26
5252	São Bernardo do Campo	26
5253	São Caetano do Sul	26
5254	São Carlos	26
5255	São Francisco	26
5256	São João da Boa Vista	26
5257	São João das Duas Pontes	26
5258	São João de Iracema	26
5259	São João do Pau d"Alho	26
5260	São Joaquim da Barra	26
5261	São José da Bela Vista	26
5262	São José do Barreiro	26
5263	São José do Rio Pardo	26
5264	São José do Rio Preto	26
5265	São José dos Campos	26
5266	São Lourenço da Serra	26
5267	São Luís do Paraitinga	26
5268	São Manuel	26
5269	São Miguel Arcanjo	26
5270	São Paulo	26
5271	São Pedro	26
5272	São Pedro do Turvo	26
5273	São Roque	26
5274	São Sebastião	26
5275	São Sebastião da Grama	26
5276	São Simão	26
5277	São Vicente	26
5278	Sarapuí	26
5279	Sarutaiá	26
5280	Sebastianópolis do Sul	26
5281	Serra Azul	26
5282	Serra Negra	26
5283	Serrana	26
5284	Sertãozinho	26
5285	Sete Barras	26
5286	Severínia	26
5287	Silveiras	26
5288	Socorro	26
5289	Sorocaba	26
5290	Sud Mennucci	26
5291	Sumaré	26
5292	Suzanápolis	26
5293	Suzano	26
5294	Tabapuã	26
5295	Tabatinga	26
5296	Taboão da Serra	26
5297	Taciba	26
5298	Taguaí	26
5299	Taiaçu	26
5300	Taiúva	26
5301	Tambaú	26
5302	Tanabi	26
5303	Tapiraí	26
5304	Tapiratiba	26
5305	Taquaral	26
5306	Taquaritinga	26
5307	Taquarituba	26
5308	Taquarivaí	26
5309	Tarabai	26
5310	Tarumã	26
5311	Tatuí	26
5312	Taubaté	26
5313	Tejupá	26
5314	Teodoro Sampaio	26
5315	Terra Roxa	26
5316	Tietê	26
5317	Timburi	26
5318	Torre de Pedra	26
5319	Torrinha	26
5320	Trabiju	26
5321	Tremembé	26
5322	Três Fronteiras	26
5323	Tuiuti	26
5324	Tupã	26
5325	Tupi Paulista	26
5326	Turiúba	26
5327	Turmalina	26
5328	Ubarana	26
5329	Ubatuba	26
5330	Ubirajara	26
5331	Uchoa	26
5332	União Paulista	26
5333	Urânia	26
5334	Uru	26
5335	Urupês	26
5336	Valentim Gentil	26
5337	Valinhos	26
5338	Valparaíso	26
5339	Vargem	26
5340	Vargem Grande do Sul	26
5341	Vargem Grande Paulista	26
5342	Várzea Paulista	26
5343	Vera Cruz	26
5344	Vinhedo	26
5345	Viradouro	26
5346	Vista Alegre do Alto	26
5347	Vitória Brasil	26
5348	Votorantim	26
5349	Votuporanga	26
5350	Zacarias	26
5351	Amparo de São Francisco	25
5352	Aquidabã	25
5353	Aracaju	25
5354	Arauá	25
5355	Areia Branca	25
5356	Barra dos Coqueiros	25
5357	Boquim	25
5358	Brejo Grande	25
5359	Campo do Brito	25
5360	Canhoba	25
5361	Canindé de São Francisco	25
5362	Capela	25
5363	Carira	25
5364	Carmópolis	25
5365	Cedro de São João	25
5366	Cristinápolis	25
5367	Cumbe	25
5368	Divina Pastora	25
5369	Estância	25
5370	Feira Nova	25
5371	Frei Paulo	25
5372	Gararu	25
5373	General Maynard	25
5374	Gracho Cardoso	25
5375	Ilha das Flores	25
5376	Indiaroba	25
5377	Itabaiana	25
5378	Itabaianinha	25
5379	Itabi	25
5380	Itaporanga d"Ajuda	25
5381	Japaratuba	25
5382	Japoatã	25
5383	Lagarto	25
5384	Laranjeiras	25
5385	Macambira	25
5386	Malhada dos Bois	25
5387	Malhador	25
5388	Maruim	25
5389	Moita Bonita	25
5390	Monte Alegre de Sergipe	25
5391	Muribeca	25
5392	Neópolis	25
5393	Nossa Senhora Aparecida	25
5394	Nossa Senhora da Glória	25
5395	Nossa Senhora das Dores	25
5396	Nossa Senhora de Lourdes	25
5397	Nossa Senhora do Socorro	25
5398	Pacatuba	25
5399	Pedra Mole	25
5400	Pedrinhas	25
5401	Pinhão	25
5402	Pirambu	25
5403	Poço Redondo	25
5404	Poço Verde	25
5405	Porto da Folha	25
5406	Propriá	25
5407	Riachão do Dantas	25
5408	Riachuelo	25
5409	Ribeirópolis	25
5410	Rosário do Catete	25
5411	Salgado	25
5412	Santa Luzia do Itanhy	25
5413	Santa Rosa de Lima	25
5414	Santana do São Francisco	25
5415	Santo Amaro das Brotas	25
5416	São Cristóvão	25
5417	São Domingos	25
5418	São Francisco	25
5419	São Miguel do Aleixo	25
5420	Simão Dias	25
5421	Siriri	25
5422	Telha	25
5423	Tobias Barreto	25
5424	Tomar do Geru	25
5425	Umbaúba	25
5426	Abreulândia	27
5427	Aguiarnópolis	27
5428	Aliança do Tocantins	27
5429	Almas	27
5430	Alvorada	27
5431	Ananás	27
5432	Angico	27
5433	Aparecida do Rio Negro	27
5434	Aragominas	27
5435	Araguacema	27
5436	Araguaçu	27
5437	Araguaína	27
5438	Araguanã	27
5439	Araguatins	27
5440	Arapoema	27
5441	Arraias	27
5442	Augustinópolis	27
5443	Aurora do Tocantins	27
5444	Axixá do Tocantins	27
5445	Babaçulândia	27
5446	Bandeirantes do Tocantins	27
5447	Barra do Ouro	27
5448	Barrolândia	27
5449	Bernardo Sayão	27
5450	Bom Jesus do Tocantins	27
5451	Brasilândia do Tocantins	27
5452	Brejinho de Nazaré	27
5453	Buriti do Tocantins	27
5454	Cachoeirinha	27
5455	Campos Lindos	27
5456	Cariri do Tocantins	27
5457	Carmolândia	27
5458	Carrasco Bonito	27
5459	Caseara	27
5460	Centenário	27
5461	Chapada da Natividade	27
5462	Chapada de Areia	27
5463	Colinas do Tocantins	27
5464	Colméia	27
5465	Combinado	27
5466	Conceição do Tocantins	27
5467	Couto de Magalhães	27
5468	Cristalândia	27
5469	Crixás do Tocantins	27
5470	Darcinópolis	27
5471	Dianópolis	27
5472	Divinópolis do Tocantins	27
5473	Dois Irmãos do Tocantins	27
5474	Dueré	27
5475	Esperantina	27
5476	Fátima	27
5477	Figueirópolis	27
5478	Filadélfia	27
5479	Formoso do Araguaia	27
5480	Fortaleza do Tabocão	27
5481	Goianorte	27
5482	Goiatins	27
5483	Guaraí	27
5484	Gurupi	27
5485	Ipueiras	27
5486	Itacajá	27
5487	Itaguatins	27
5488	Itapiratins	27
5489	Itaporã do Tocantins	27
5490	Jaú do Tocantins	27
5491	Juarina	27
5492	Lagoa da Confusão	27
5493	Lagoa do Tocantins	27
5494	Lajeado	27
5495	Lavandeira	27
5496	Lizarda	27
5497	Luzinópolis	27
5498	Marianópolis do Tocantins	27
5499	Mateiros	27
5500	Maurilândia do Tocantins	27
5501	Miracema do Tocantins	27
5502	Miranorte	27
5503	Monte do Carmo	27
5504	Monte Santo do Tocantins	27
5505	Muricilândia	27
5506	Natividade	27
5507	Nazaré	27
5508	Nova Olinda	27
5509	Nova Rosalândia	27
5510	Novo Acordo	27
5511	Novo Alegre	27
5512	Novo Jardim	27
5513	Oliveira de Fátima	27
5514	Palmas	27
5515	Palmeirante	27
5516	Palmeiras do Tocantins	27
5517	Palmeirópolis	27
5518	Paraíso do Tocantins	27
5519	Paranã	27
5520	Pau d"Arco	27
5521	Pedro Afonso	27
5522	Peixe	27
5523	Pequizeiro	27
5524	Pindorama do Tocantins	27
5525	Piraquê	27
5526	Pium	27
5527	Ponte Alta do Bom Jesus	27
5528	Ponte Alta do Tocantins	27
5529	Porto Alegre do Tocantins	27
5530	Porto Nacional	27
5531	Praia Norte	27
5532	Presidente Kennedy	27
5533	Pugmil	27
5534	Recursolândia	27
5535	Riachinho	27
5536	Rio da Conceição	27
5537	Rio dos Bois	27
5538	Rio Sono	27
5539	Sampaio	27
5540	Sandolândia	27
5541	Santa Fé do Araguaia	27
5542	Santa Maria do Tocantins	27
5543	Santa Rita do Tocantins	27
5544	Santa Rosa do Tocantins	27
5545	Santa Tereza do Tocantins	27
5546	Santa Terezinha do Tocantins	27
5547	São Bento do Tocantins	27
5548	São Félix do Tocantins	27
5549	São Miguel do Tocantins	27
5550	São Salvador do Tocantins	27
5551	São Sebastião do Tocantins	27
5552	São Valério da Natividade	27
5553	Silvanópolis	27
5554	Sítio Novo do Tocantins	27
5555	Sucupira	27
5556	Taguatinga	27
5557	Taipas do Tocantins	27
5558	Talismã	27
5559	Tocantínia	27
5560	Tocantinópolis	27
5561	Tupirama	27
5562	Tupiratins	27
5563	Wanderlândia	27
5564	Xambioá	27
\.


--
-- TOC entry 3097 (class 0 OID 16625)
-- Dependencies: 204
-- Data for Name: tb_clti; Type: TABLE DATA; Schema: db_clti; Owner: postgres
--

COPY db_clti.tb_clti (idtb_clti, idtipos_clti, efetivo_oficiais, efetivo_pracas, nome, sigla, indicativo, data_ativacao) FROM stdin;
3	16	3	9	CLTI COM3ºDN	CLTI-3ºDN	CLTINA	2012-04-30
\.


--
-- TOC entry 3128 (class 0 OID 16991)
-- Dependencies: 235
-- Data for Name: tb_conectividade; Type: TABLE DATA; Schema: db_clti; Owner: sisclti
--

COPY db_clti.tb_conectividade (idtb_conectividade, idtb_om_apoiadas, fabricante, modelo, localizacao, end_ip, data_aquisicao, data_garantia) FROM stdin;
1	5	CISCO	C375048PS-S	SALA DE SERVIDORES	172.23.117.20	2019-05-17	2020-05-17
2	5	CISCO	C375048PS-S	SALA DE SERVIDORES	172.23.117.22	2019-05-17	2020-05-17
\.


--
-- TOC entry 3098 (class 0 OID 16629)
-- Dependencies: 205
-- Data for Name: tb_config; Type: TABLE DATA; Schema: db_clti; Owner: postgres
--

COPY db_clti.tb_config (idtb_config, parametro, valor) FROM stdin;
1	URL	http://localhost/sisclti
2	ESTADO	RN
3	CIDADE	Natal
\.


--
-- TOC entry 3101 (class 0 OID 16639)
-- Dependencies: 208
-- Data for Name: tb_corpo_quadro; Type: TABLE DATA; Schema: db_clti; Owner: postgres
--

COPY db_clti.tb_corpo_quadro (idtb_corpo_quadro, nome, sigla) FROM stdin;
1	CFN	FN
2	CA	CA
3	CPFN	FN
4	CPA	CPA
5	CAP	CAP
6	CAF	CAF
7	CSM	S
8	CD	CD
9	IM	IM
10	T	T
11	NA	N/A
12	AFN	AFN
13	RM2	RM2
14	MD	MD
15	F	F
16	QC-FN	QC-FN
17	Corpo de Praças da Reserva	CPR
18	QC-IM	QC-IM
\.


--
-- TOC entry 3103 (class 0 OID 16645)
-- Dependencies: 210
-- Data for Name: tb_especialidade; Type: TABLE DATA; Schema: db_clti; Owner: postgres
--

COPY db_clti.tb_especialidade (idtb_especialidade, nome, sigla) FROM stdin;
1	Infantaria	IF
2	Escrita	ES
3	Comunicações Navais	CN
4	Administração	AD
5	Artilharia	AT
6	Motorista	MO
7	Engenharia	EG
8	Eletrônica	ET
9	Músico	MU
10	Processamento de Dados	PD
11	Corneteiro	CT
12	Não Aplicável	NA
13	Não Informada	NI
14	Caldeira	CA
15	Enfermeiro	EF
16	Cozinheiro	CO
17	Arrumador	AR
18	Barbeiro	BA
19	Reservista Primeira Categoria	RM1
20	Manobras e Reparo de Avição	RV
21	Carpinteiro	CP
22	Recruta	RC
23	RESERVISTA DE SEGUNDA CATEGORIA	RM-2
24	Máquinas	MA
\.


--
-- TOC entry 3122 (class 0 OID 16885)
-- Dependencies: 229
-- Data for Name: tb_estacoes; Type: TABLE DATA; Schema: db_clti; Owner: postgres
--

COPY db_clti.tb_estacoes (idtb_estacoes, idtb_om_apoiadas, fabricante, modelo, processador, memoria, armazenamento, idtb_sor, end_ip, data_aquisicao, data_garantia, localizacao, req_minimos, situacao) FROM stdin;
2	5	ARQUIMEDES	A85871	INTEL CORE I5 3.2GHZ	2X8GB	2X1TB SATA	9	172.23.119.35	2019-05-20	2020-05-20	CLTI - DIVISãO DE SISTEMAS	SIM	EM PRODUÇÃO
1	5	ARQUIMEDES	A85871	INTEL CORE I5 3.2GHZ	2X8GB	2X1TB SATA	9	172.23.119.36	2019-05-20	2020-05-20	CLTI - DIVISãO DE SISTEMAS	SIM	EM PRODUÇÃO
\.


--
-- TOC entry 3104 (class 0 OID 16649)
-- Dependencies: 211
-- Data for Name: tb_estado; Type: TABLE DATA; Schema: db_clti; Owner: postgres
--

COPY db_clti.tb_estado (id, nome, uf, pais) FROM stdin;
1	Acre	AC	1
2	Alagoas	AL	1
3	Amazonas	AM	1
4	Amapá	AP	1
5	Bahia	BA	1
6	Ceará	CE	1
7	Distrito Federal	DF	1
8	Espírito Santo	ES	1
9	Goiás	GO	1
10	Maranhão	MA	1
11	Minas Gerais	MG	1
12	Mato Grosso do Sul	MS	1
13	Mato Grosso	MT	1
14	Pará	PA	1
15	Paraíba	PB	1
16	Pernambuco	PE	1
17	Piauí	PI	1
18	Paraná	PR	1
19	Rio de Janeiro	RJ	1
20	Rio Grande do Norte	RN	1
21	Rondônia	RO	1
22	Roraima	RR	1
23	Rio Grande do Sul	RS	1
24	Santa Catarina	SC	1
25	Sergipe	SE	1
26	São Paulo	SP	1
27	Tocantins	TO	1
\.


--
-- TOC entry 3106 (class 0 OID 16655)
-- Dependencies: 213
-- Data for Name: tb_lotacao_clti; Type: TABLE DATA; Schema: db_clti; Owner: postgres
--

COPY db_clti.tb_lotacao_clti (idtripulacao_clti, id_posto_grad, id_corpo_quadro, id_especialidade, nip, cpf, nome, nome_guerra, status, senha, perfil) FROM stdin;
18	16	1	8	99242991	\N	LUCIO ALEXANDRE CORREIA DOS SANTOS	ALEXANDRE	ATIVO	c4ce9a5fa42b7026826369e2e6faa9d3b15f0394e56d37e55c58dd2c5e4001594a9ca4efe19e6ac6	TEC_CLTI
20	21	11	12	12345678		ADMINCLTI	ADMINCLTI	ATIVO	1f82ea75c5cc526729e2d581aeb3aeccfef4407e256127614ef298fedf9376775a7d7328090f63bf	TEC_CLTI
\.


--
-- TOC entry 3108 (class 0 OID 16665)
-- Dependencies: 215
-- Data for Name: tb_om_apoiadas; Type: TABLE DATA; Schema: db_clti; Owner: postgres
--

COPY db_clti.tb_om_apoiadas (idtb_om_apoiadas, cod_om, nome, sigla, indicativo, id_estado, id_cidade) FROM stdin;
5	83000	COMANDO DO 3º DISTRITO NAVAL	COM3ºDN	TERDIS	20	3770
\.


--
-- TOC entry 3110 (class 0 OID 16671)
-- Dependencies: 217
-- Data for Name: tb_osic; Type: TABLE DATA; Schema: db_clti; Owner: postgres
--

COPY db_clti.tb_osic (idtb_osic, id_om, id_posto_grad, id_corpo_quadro, id_especialidade, nip, cpf, nome, nome_guerra, perfil, senha, status) FROM stdin;
3	5	8	13	12	12345678		LUCIO A C SANTOS	ALEXANDRE	OSIC_OM	0b3442d7bd3838472125d3e49b54f30d55140c0a	ATIVO
\.


--
-- TOC entry 3111 (class 0 OID 16675)
-- Dependencies: 218
-- Data for Name: tb_pais; Type: TABLE DATA; Schema: db_clti; Owner: postgres
--

COPY db_clti.tb_pais (id, nome, sigla) FROM stdin;
1	Brasil	BR
\.


--
-- TOC entry 3124 (class 0 OID 16906)
-- Dependencies: 231
-- Data for Name: tb_pessoal_ti; Type: TABLE DATA; Schema: db_clti; Owner: postgres
--

COPY db_clti.tb_pessoal_ti (idtb_pessoal_ti, idtb_om_apoiada, idtb_posto_grad, idtb_corpo_quadro, idtb_especialidade, nip, cpf, nome, nome_guerra, correio_eletronico, funcao, situacao) FROM stdin;
\.


--
-- TOC entry 3112 (class 0 OID 16679)
-- Dependencies: 219
-- Data for Name: tb_posto_grad; Type: TABLE DATA; Schema: db_clti; Owner: postgres
--

COPY db_clti.tb_posto_grad (idtb_posto_grad, nome, sigla) FROM stdin;
1	Almirante-de-Esquadra	AE
2	Vice-Almirante	VA
3	Contra-Almirante	CA
4	Capitão-de-Mar-e-Guerra	CMG
5	Capitão-de-Fragata	CF
6	Capitão-de-Corveta	CC
7	Capitão-Tenente	CT
8	Primeiro-Tenente	1ºTen
9	Segundo-Tenente	2ºTen
10	Guarda-Marinha	GM
11	Aspirante	ASP
12	Suboficial	SO
13	Primeiro-Sargento	1ºSG
14	Segundo-Sargento	2ºSG
15	Terceiro-Sargento	3ºSG
16	Cabo	CB
17	Soldado	SD
18	Marinheiro Especializado	MN-ESP
19	Marinheiro	MN
20	Marinheiro Recruta	MN-RC
21	Servidor Civil	SCivil
\.


--
-- TOC entry 3126 (class 0 OID 16937)
-- Dependencies: 233
-- Data for Name: tb_qualificacao_ti; Type: TABLE DATA; Schema: db_clti; Owner: postgres
--

COPY db_clti.tb_qualificacao_ti (idtb_qualificacao_ti, idtb_pessoal_ti, nome_curso, instituicao, data_conclusao, carga_horaria, tipo, custo, meio) FROM stdin;
\.


--
-- TOC entry 3120 (class 0 OID 16864)
-- Dependencies: 227
-- Data for Name: tb_servidores; Type: TABLE DATA; Schema: db_clti; Owner: sisclti
--

COPY db_clti.tb_servidores (idtb_servidores, idtb_om_apoiadas, modelo, processador, memoria, armazenamento, rede, idtb_sor, end_ip, finalidade, data_aquisicao, data_garantia, fabricante, localizacao) FROM stdin;
1	5	DL 360 GEN9	INTEL XEON 3.2GHZ	4X8GB	4X600GB SAS	2XGIGABIT	6	192.168.1.100	SERVIDOR WEB	2012-05-15	2020-04-20	DELL	SALA DE SERVIDORES
2	5	A85871	INTEL CORE I5 3.2GHZ	2X8GB	2X1TB SATA	2XGIGABIT	6	172.23.116.11	SERVIDOR WEB	2019-10-20	2020-10-20	ARQUIMEDES	CLTI - DIVISãO DE SISTEMAS
\.


--
-- TOC entry 3118 (class 0 OID 16811)
-- Dependencies: 225
-- Data for Name: tb_sor; Type: TABLE DATA; Schema: db_clti; Owner: sisclti
--

COPY db_clti.tb_sor (idtb_sor, desenvolvedor, descricao, versao, situacao) FROM stdin;
1	MICROSOFT	WINDOWS	XP	DESCONTINUADO
2	MICROSOFT	WINDOWS	7	DESCONTINUADO
3	MICROSOFT	WINDOWS	8	DESCONTINUADO
4	MICROSOFT	WINDOWS	8.1	ATIVO
5	MICROSOFT	WINDOWS	10	ATIVO
6	ORACLE	ORACLE LINUX	7	ATIVO
7	CANONICAL	UBUNTU MB	14.04	DESCONTINUADO
8	CANONICAL	UBUNTU MB	16.04	ATIVO
9	CANONICAL	UBUNTU MB	18.04	ATIVO
10	CANONICAL	UBUNTU MB	14.04	ATIVO
11	CANONICAL	UBUNTU MB	14.04	DESCONTINUADO
\.


--
-- TOC entry 3116 (class 0 OID 16688)
-- Dependencies: 223
-- Data for Name: tb_tipos_clti; Type: TABLE DATA; Schema: db_clti; Owner: postgres
--

COPY db_clti.tb_tipos_clti (idtipos_clti, norma_atual, data_norma, lotacao_oficiais, lotacao_pracas, tipo_clti) FROM stdin;
16	DCTIMARINST 30-09C	2018-01-22	2	5	1
\.


--
-- TOC entry 3174 (class 0 OID 0)
-- Dependencies: 197
-- Name: cidade_id_sequence; Type: SEQUENCE SET; Schema: db_clti; Owner: postgres
--

SELECT pg_catalog.setval('db_clti.cidade_id_sequence', 1, false);


--
-- TOC entry 3175 (class 0 OID 0)
-- Dependencies: 198
-- Name: estado_id_sequence; Type: SEQUENCE SET; Schema: db_clti; Owner: postgres
--

SELECT pg_catalog.setval('db_clti.estado_id_sequence', 1, false);


--
-- TOC entry 3176 (class 0 OID 0)
-- Dependencies: 199
-- Name: pais_id_sequence; Type: SEQUENCE SET; Schema: db_clti; Owner: postgres
--

SELECT pg_catalog.setval('db_clti.pais_id_sequence', 1, false);


--
-- TOC entry 3177 (class 0 OID 0)
-- Dependencies: 200
-- Name: tb_admin_idtb_admin_sequence; Type: SEQUENCE SET; Schema: db_clti; Owner: postgres
--

SELECT pg_catalog.setval('db_clti.tb_admin_idtb_admin_sequence', 3, true);


--
-- TOC entry 3178 (class 0 OID 0)
-- Dependencies: 203
-- Name: tb_clti_idtb_clti_sequence; Type: SEQUENCE SET; Schema: db_clti; Owner: postgres
--

SELECT pg_catalog.setval('db_clti.tb_clti_idtb_clti_sequence', 3, true);


--
-- TOC entry 3179 (class 0 OID 0)
-- Dependencies: 234
-- Name: tb_conectividade_idtb_conectividade_seq; Type: SEQUENCE SET; Schema: db_clti; Owner: sisclti
--

SELECT pg_catalog.setval('db_clti.tb_conectividade_idtb_conectividade_seq', 2, true);


--
-- TOC entry 3180 (class 0 OID 0)
-- Dependencies: 206
-- Name: tb_config_idtb_config_seq; Type: SEQUENCE SET; Schema: db_clti; Owner: postgres
--

SELECT pg_catalog.setval('db_clti.tb_config_idtb_config_seq', 3, true);


--
-- TOC entry 3181 (class 0 OID 0)
-- Dependencies: 207
-- Name: tb_corpo_quadro_idtb_corpo_quadro_sequence; Type: SEQUENCE SET; Schema: db_clti; Owner: postgres
--

SELECT pg_catalog.setval('db_clti.tb_corpo_quadro_idtb_corpo_quadro_sequence', 18, true);


--
-- TOC entry 3182 (class 0 OID 0)
-- Dependencies: 209
-- Name: tb_especialidade_idtb_especialidade_sequence; Type: SEQUENCE SET; Schema: db_clti; Owner: postgres
--

SELECT pg_catalog.setval('db_clti.tb_especialidade_idtb_especialidade_sequence', 24, true);


--
-- TOC entry 3183 (class 0 OID 0)
-- Dependencies: 228
-- Name: tb_estacoes_idtb_estacoes_seq; Type: SEQUENCE SET; Schema: db_clti; Owner: postgres
--

SELECT pg_catalog.setval('db_clti.tb_estacoes_idtb_estacoes_seq', 2, true);


--
-- TOC entry 3184 (class 0 OID 0)
-- Dependencies: 214
-- Name: tb_om_apoiadas_idtb_om_apoiadas_sequence; Type: SEQUENCE SET; Schema: db_clti; Owner: postgres
--

SELECT pg_catalog.setval('db_clti.tb_om_apoiadas_idtb_om_apoiadas_sequence', 5, true);


--
-- TOC entry 3185 (class 0 OID 0)
-- Dependencies: 216
-- Name: tb_osic_idtb_osic_sequence; Type: SEQUENCE SET; Schema: db_clti; Owner: postgres
--

SELECT pg_catalog.setval('db_clti.tb_osic_idtb_osic_sequence', 3, true);


--
-- TOC entry 3186 (class 0 OID 0)
-- Dependencies: 230
-- Name: tb_pessoal_ti_idtb_pessoal_ti_seq; Type: SEQUENCE SET; Schema: db_clti; Owner: postgres
--

SELECT pg_catalog.setval('db_clti.tb_pessoal_ti_idtb_pessoal_ti_seq', 1, false);


--
-- TOC entry 3187 (class 0 OID 0)
-- Dependencies: 220
-- Name: tb_posto_grad_idtb_posto_grad_seq; Type: SEQUENCE SET; Schema: db_clti; Owner: postgres
--

SELECT pg_catalog.setval('db_clti.tb_posto_grad_idtb_posto_grad_seq', 21, true);


--
-- TOC entry 3188 (class 0 OID 0)
-- Dependencies: 221
-- Name: tb_posto_grad_idtb_posto_grad_sequence; Type: SEQUENCE SET; Schema: db_clti; Owner: postgres
--

SELECT pg_catalog.setval('db_clti.tb_posto_grad_idtb_posto_grad_sequence', 22, true);


--
-- TOC entry 3189 (class 0 OID 0)
-- Dependencies: 232
-- Name: tb_qualificacao_ti_idtb_qualificacao_ti_seq; Type: SEQUENCE SET; Schema: db_clti; Owner: postgres
--

SELECT pg_catalog.setval('db_clti.tb_qualificacao_ti_idtb_qualificacao_ti_seq', 1, false);


--
-- TOC entry 3190 (class 0 OID 0)
-- Dependencies: 226
-- Name: tb_servidores_idtb_servidores_seq; Type: SEQUENCE SET; Schema: db_clti; Owner: sisclti
--

SELECT pg_catalog.setval('db_clti.tb_servidores_idtb_servidores_seq', 2, true);


--
-- TOC entry 3191 (class 0 OID 0)
-- Dependencies: 224
-- Name: tb_sor_idtb_sor_seq; Type: SEQUENCE SET; Schema: db_clti; Owner: sisclti
--

SELECT pg_catalog.setval('db_clti.tb_sor_idtb_sor_seq', 11, true);


--
-- TOC entry 3192 (class 0 OID 0)
-- Dependencies: 222
-- Name: tb_tipos_clti_idtipos_clti_sequence; Type: SEQUENCE SET; Schema: db_clti; Owner: postgres
--

SELECT pg_catalog.setval('db_clti.tb_tipos_clti_idtipos_clti_sequence', 16, true);


--
-- TOC entry 3193 (class 0 OID 0)
-- Dependencies: 212
-- Name: tb_tripulacao_clti_idtripulacao_clti_sequence; Type: SEQUENCE SET; Schema: db_clti; Owner: postgres
--

SELECT pg_catalog.setval('db_clti.tb_tripulacao_clti_idtripulacao_clti_sequence', 20, true);


--
-- TOC entry 2899 (class 2606 OID 16696)
-- Name: tb_cidade cidade_pkey; Type: CONSTRAINT; Schema: db_clti; Owner: postgres
--

ALTER TABLE ONLY db_clti.tb_cidade
    ADD CONSTRAINT cidade_pkey PRIMARY KEY (id);


--
-- TOC entry 2909 (class 2606 OID 16698)
-- Name: tb_estado estado_pkey; Type: CONSTRAINT; Schema: db_clti; Owner: postgres
--

ALTER TABLE ONLY db_clti.tb_estado
    ADD CONSTRAINT estado_pkey PRIMARY KEY (id);


--
-- TOC entry 2924 (class 2606 OID 16700)
-- Name: tb_pais pais_pkey; Type: CONSTRAINT; Schema: db_clti; Owner: postgres
--

ALTER TABLE ONLY db_clti.tb_pais
    ADD CONSTRAINT pais_pkey PRIMARY KEY (id);


--
-- TOC entry 2897 (class 2606 OID 16704)
-- Name: tb_admin tb_admin_pkey; Type: CONSTRAINT; Schema: db_clti; Owner: postgres
--

ALTER TABLE ONLY db_clti.tb_admin
    ADD CONSTRAINT tb_admin_pkey PRIMARY KEY (idtb_admin);


--
-- TOC entry 2901 (class 2606 OID 16706)
-- Name: tb_clti tb_clti_pkey; Type: CONSTRAINT; Schema: db_clti; Owner: postgres
--

ALTER TABLE ONLY db_clti.tb_clti
    ADD CONSTRAINT tb_clti_pkey PRIMARY KEY (idtb_clti);


--
-- TOC entry 2944 (class 2606 OID 17012)
-- Name: tb_conectividade tb_conectividade_end_ip_key; Type: CONSTRAINT; Schema: db_clti; Owner: sisclti
--

ALTER TABLE ONLY db_clti.tb_conectividade
    ADD CONSTRAINT tb_conectividade_end_ip_key UNIQUE (end_ip);


--
-- TOC entry 2946 (class 2606 OID 16999)
-- Name: tb_conectividade tb_conectividade_pkey; Type: CONSTRAINT; Schema: db_clti; Owner: sisclti
--

ALTER TABLE ONLY db_clti.tb_conectividade
    ADD CONSTRAINT tb_conectividade_pkey PRIMARY KEY (idtb_conectividade);


--
-- TOC entry 2903 (class 2606 OID 16708)
-- Name: tb_config tb_config_pkey; Type: CONSTRAINT; Schema: db_clti; Owner: postgres
--

ALTER TABLE ONLY db_clti.tb_config
    ADD CONSTRAINT tb_config_pkey PRIMARY KEY (idtb_config);


--
-- TOC entry 2905 (class 2606 OID 16710)
-- Name: tb_corpo_quadro tb_corpo_quadro_pkey; Type: CONSTRAINT; Schema: db_clti; Owner: postgres
--

ALTER TABLE ONLY db_clti.tb_corpo_quadro
    ADD CONSTRAINT tb_corpo_quadro_pkey PRIMARY KEY (idtb_corpo_quadro);


--
-- TOC entry 2907 (class 2606 OID 16712)
-- Name: tb_especialidade tb_especialidade_pkey; Type: CONSTRAINT; Schema: db_clti; Owner: postgres
--

ALTER TABLE ONLY db_clti.tb_especialidade
    ADD CONSTRAINT tb_especialidade_pkey PRIMARY KEY (idtb_especialidade);


--
-- TOC entry 2936 (class 2606 OID 17008)
-- Name: tb_estacoes tb_estacoes_end_ip_key; Type: CONSTRAINT; Schema: db_clti; Owner: postgres
--

ALTER TABLE ONLY db_clti.tb_estacoes
    ADD CONSTRAINT tb_estacoes_end_ip_key UNIQUE (end_ip);


--
-- TOC entry 2938 (class 2606 OID 16893)
-- Name: tb_estacoes tb_estacoes_pkey; Type: CONSTRAINT; Schema: db_clti; Owner: postgres
--

ALTER TABLE ONLY db_clti.tb_estacoes
    ADD CONSTRAINT tb_estacoes_pkey PRIMARY KEY (idtb_estacoes);


--
-- TOC entry 2918 (class 2606 OID 16714)
-- Name: tb_om_apoiadas tb_om_apoiadas_cod_om_nome_sigla_indicativo_key; Type: CONSTRAINT; Schema: db_clti; Owner: postgres
--

ALTER TABLE ONLY db_clti.tb_om_apoiadas
    ADD CONSTRAINT tb_om_apoiadas_cod_om_nome_sigla_indicativo_key UNIQUE (cod_om, nome, sigla, indicativo);


--
-- TOC entry 2920 (class 2606 OID 16716)
-- Name: tb_om_apoiadas tb_om_apoiadas_pkey; Type: CONSTRAINT; Schema: db_clti; Owner: postgres
--

ALTER TABLE ONLY db_clti.tb_om_apoiadas
    ADD CONSTRAINT tb_om_apoiadas_pkey PRIMARY KEY (idtb_om_apoiadas);


--
-- TOC entry 2922 (class 2606 OID 16718)
-- Name: tb_osic tb_osic_pkey; Type: CONSTRAINT; Schema: db_clti; Owner: postgres
--

ALTER TABLE ONLY db_clti.tb_osic
    ADD CONSTRAINT tb_osic_pkey PRIMARY KEY (idtb_osic);


--
-- TOC entry 2940 (class 2606 OID 16983)
-- Name: tb_pessoal_ti tb_pessoal_ti_pkey; Type: CONSTRAINT; Schema: db_clti; Owner: postgres
--

ALTER TABLE ONLY db_clti.tb_pessoal_ti
    ADD CONSTRAINT tb_pessoal_ti_pkey PRIMARY KEY (idtb_pessoal_ti);


--
-- TOC entry 2926 (class 2606 OID 16720)
-- Name: tb_posto_grad tb_posto_grad_pkey; Type: CONSTRAINT; Schema: db_clti; Owner: postgres
--

ALTER TABLE ONLY db_clti.tb_posto_grad
    ADD CONSTRAINT tb_posto_grad_pkey PRIMARY KEY (idtb_posto_grad);


--
-- TOC entry 2942 (class 2606 OID 16945)
-- Name: tb_qualificacao_ti tb_qualificacao_ti_pkey; Type: CONSTRAINT; Schema: db_clti; Owner: postgres
--

ALTER TABLE ONLY db_clti.tb_qualificacao_ti
    ADD CONSTRAINT tb_qualificacao_ti_pkey PRIMARY KEY (idtb_qualificacao_ti);


--
-- TOC entry 2932 (class 2606 OID 17010)
-- Name: tb_servidores tb_servidores_end_ip_key; Type: CONSTRAINT; Schema: db_clti; Owner: sisclti
--

ALTER TABLE ONLY db_clti.tb_servidores
    ADD CONSTRAINT tb_servidores_end_ip_key UNIQUE (end_ip);


--
-- TOC entry 2934 (class 2606 OID 16872)
-- Name: tb_servidores tb_servidores_pkey; Type: CONSTRAINT; Schema: db_clti; Owner: sisclti
--

ALTER TABLE ONLY db_clti.tb_servidores
    ADD CONSTRAINT tb_servidores_pkey PRIMARY KEY (idtb_servidores);


--
-- TOC entry 2930 (class 2606 OID 16819)
-- Name: tb_sor tb_sor_pkey; Type: CONSTRAINT; Schema: db_clti; Owner: sisclti
--

ALTER TABLE ONLY db_clti.tb_sor
    ADD CONSTRAINT tb_sor_pkey PRIMARY KEY (idtb_sor);


--
-- TOC entry 2928 (class 2606 OID 16722)
-- Name: tb_tipos_clti tb_tipos_clti_pkey; Type: CONSTRAINT; Schema: db_clti; Owner: postgres
--

ALTER TABLE ONLY db_clti.tb_tipos_clti
    ADD CONSTRAINT tb_tipos_clti_pkey PRIMARY KEY (idtipos_clti);


--
-- TOC entry 2914 (class 2606 OID 16724)
-- Name: tb_lotacao_clti tb_tripulacao_clti_pkey; Type: CONSTRAINT; Schema: db_clti; Owner: postgres
--

ALTER TABLE ONLY db_clti.tb_lotacao_clti
    ADD CONSTRAINT tb_tripulacao_clti_pkey PRIMARY KEY (idtripulacao_clti);


--
-- TOC entry 2916 (class 2606 OID 16726)
-- Name: tb_lotacao_clti unico_nip_cpf; Type: CONSTRAINT; Schema: db_clti; Owner: postgres
--

ALTER TABLE ONLY db_clti.tb_lotacao_clti
    ADD CONSTRAINT unico_nip_cpf UNIQUE (nip, cpf);


--
-- TOC entry 2910 (class 1259 OID 16727)
-- Name: fki_id_corpo_quadro; Type: INDEX; Schema: db_clti; Owner: postgres
--

CREATE INDEX fki_id_corpo_quadro ON db_clti.tb_lotacao_clti USING btree (id_corpo_quadro);


--
-- TOC entry 2911 (class 1259 OID 16728)
-- Name: fki_id_especialidade; Type: INDEX; Schema: db_clti; Owner: postgres
--

CREATE INDEX fki_id_especialidade ON db_clti.tb_lotacao_clti USING btree (id_especialidade);


--
-- TOC entry 2912 (class 1259 OID 16729)
-- Name: fki_id_posto_grad; Type: INDEX; Schema: db_clti; Owner: postgres
--

CREATE INDEX fki_id_posto_grad ON db_clti.tb_lotacao_clti USING btree (id_posto_grad);


--
-- TOC entry 2947 (class 2606 OID 16735)
-- Name: tb_admin tb_admin_id_corpo_quadro_fkey; Type: FK CONSTRAINT; Schema: db_clti; Owner: postgres
--

ALTER TABLE ONLY db_clti.tb_admin
    ADD CONSTRAINT tb_admin_id_corpo_quadro_fkey FOREIGN KEY (id_corpo_quadro) REFERENCES db_clti.tb_corpo_quadro(idtb_corpo_quadro);


--
-- TOC entry 2948 (class 2606 OID 16740)
-- Name: tb_admin tb_admin_id_especialidade_fkey; Type: FK CONSTRAINT; Schema: db_clti; Owner: postgres
--

ALTER TABLE ONLY db_clti.tb_admin
    ADD CONSTRAINT tb_admin_id_especialidade_fkey FOREIGN KEY (id_especialidade) REFERENCES db_clti.tb_especialidade(idtb_especialidade);


--
-- TOC entry 2949 (class 2606 OID 16745)
-- Name: tb_admin tb_admin_id_om_fkey; Type: FK CONSTRAINT; Schema: db_clti; Owner: postgres
--

ALTER TABLE ONLY db_clti.tb_admin
    ADD CONSTRAINT tb_admin_id_om_fkey FOREIGN KEY (id_om) REFERENCES db_clti.tb_om_apoiadas(idtb_om_apoiadas);


--
-- TOC entry 2950 (class 2606 OID 16750)
-- Name: tb_admin tb_admin_id_posto_grad_fkey; Type: FK CONSTRAINT; Schema: db_clti; Owner: postgres
--

ALTER TABLE ONLY db_clti.tb_admin
    ADD CONSTRAINT tb_admin_id_posto_grad_fkey FOREIGN KEY (id_posto_grad) REFERENCES db_clti.tb_posto_grad(idtb_posto_grad);


--
-- TOC entry 2951 (class 2606 OID 16755)
-- Name: tb_clti tb_clti_idtipos_clti_fkey; Type: FK CONSTRAINT; Schema: db_clti; Owner: postgres
--

ALTER TABLE ONLY db_clti.tb_clti
    ADD CONSTRAINT tb_clti_idtipos_clti_fkey FOREIGN KEY (idtipos_clti) REFERENCES db_clti.tb_tipos_clti(idtipos_clti);


--
-- TOC entry 2968 (class 2606 OID 17000)
-- Name: tb_conectividade tb_conectividade_idtb_om_apoiadas_fkey; Type: FK CONSTRAINT; Schema: db_clti; Owner: sisclti
--

ALTER TABLE ONLY db_clti.tb_conectividade
    ADD CONSTRAINT tb_conectividade_idtb_om_apoiadas_fkey FOREIGN KEY (idtb_om_apoiadas) REFERENCES db_clti.tb_om_apoiadas(idtb_om_apoiadas) NOT VALID;


--
-- TOC entry 2961 (class 2606 OID 16947)
-- Name: tb_estacoes tb_estacoes_idtb_om_apoiadas_fkey; Type: FK CONSTRAINT; Schema: db_clti; Owner: postgres
--

ALTER TABLE ONLY db_clti.tb_estacoes
    ADD CONSTRAINT tb_estacoes_idtb_om_apoiadas_fkey FOREIGN KEY (idtb_om_apoiadas) REFERENCES db_clti.tb_om_apoiadas(idtb_om_apoiadas) NOT VALID;


--
-- TOC entry 2962 (class 2606 OID 16952)
-- Name: tb_estacoes tb_estacoes_idtb_sor_fkey; Type: FK CONSTRAINT; Schema: db_clti; Owner: postgres
--

ALTER TABLE ONLY db_clti.tb_estacoes
    ADD CONSTRAINT tb_estacoes_idtb_sor_fkey FOREIGN KEY (idtb_sor) REFERENCES db_clti.tb_sor(idtb_sor) NOT VALID;


--
-- TOC entry 2952 (class 2606 OID 16760)
-- Name: tb_lotacao_clti tb_lotacao_clti_id_corpo_quadro_fkey; Type: FK CONSTRAINT; Schema: db_clti; Owner: postgres
--

ALTER TABLE ONLY db_clti.tb_lotacao_clti
    ADD CONSTRAINT tb_lotacao_clti_id_corpo_quadro_fkey FOREIGN KEY (id_corpo_quadro) REFERENCES db_clti.tb_corpo_quadro(idtb_corpo_quadro);


--
-- TOC entry 2953 (class 2606 OID 16765)
-- Name: tb_lotacao_clti tb_lotacao_clti_id_especialidade_fkey; Type: FK CONSTRAINT; Schema: db_clti; Owner: postgres
--

ALTER TABLE ONLY db_clti.tb_lotacao_clti
    ADD CONSTRAINT tb_lotacao_clti_id_especialidade_fkey FOREIGN KEY (id_especialidade) REFERENCES db_clti.tb_especialidade(idtb_especialidade);


--
-- TOC entry 2954 (class 2606 OID 16770)
-- Name: tb_lotacao_clti tb_lotacao_clti_id_posto_grad_fkey; Type: FK CONSTRAINT; Schema: db_clti; Owner: postgres
--

ALTER TABLE ONLY db_clti.tb_lotacao_clti
    ADD CONSTRAINT tb_lotacao_clti_id_posto_grad_fkey FOREIGN KEY (id_posto_grad) REFERENCES db_clti.tb_posto_grad(idtb_posto_grad);


--
-- TOC entry 2955 (class 2606 OID 16775)
-- Name: tb_om_apoiadas tb_om_apoiadas_id_cidade_fkey; Type: FK CONSTRAINT; Schema: db_clti; Owner: postgres
--

ALTER TABLE ONLY db_clti.tb_om_apoiadas
    ADD CONSTRAINT tb_om_apoiadas_id_cidade_fkey FOREIGN KEY (id_cidade) REFERENCES db_clti.tb_cidade(id);


--
-- TOC entry 2956 (class 2606 OID 16780)
-- Name: tb_om_apoiadas tb_om_apoiadas_id_estado_fkey; Type: FK CONSTRAINT; Schema: db_clti; Owner: postgres
--

ALTER TABLE ONLY db_clti.tb_om_apoiadas
    ADD CONSTRAINT tb_om_apoiadas_id_estado_fkey FOREIGN KEY (id_estado) REFERENCES db_clti.tb_estado(id);


--
-- TOC entry 2957 (class 2606 OID 16785)
-- Name: tb_osic tb_osic_id_corpo_quadro_fkey; Type: FK CONSTRAINT; Schema: db_clti; Owner: postgres
--

ALTER TABLE ONLY db_clti.tb_osic
    ADD CONSTRAINT tb_osic_id_corpo_quadro_fkey FOREIGN KEY (id_corpo_quadro) REFERENCES db_clti.tb_corpo_quadro(idtb_corpo_quadro);


--
-- TOC entry 2958 (class 2606 OID 16790)
-- Name: tb_osic tb_osic_id_especialidade_fkey; Type: FK CONSTRAINT; Schema: db_clti; Owner: postgres
--

ALTER TABLE ONLY db_clti.tb_osic
    ADD CONSTRAINT tb_osic_id_especialidade_fkey FOREIGN KEY (id_especialidade) REFERENCES db_clti.tb_especialidade(idtb_especialidade);


--
-- TOC entry 2959 (class 2606 OID 16795)
-- Name: tb_osic tb_osic_id_posto_grad_fkey; Type: FK CONSTRAINT; Schema: db_clti; Owner: postgres
--

ALTER TABLE ONLY db_clti.tb_osic
    ADD CONSTRAINT tb_osic_id_posto_grad_fkey FOREIGN KEY (id_posto_grad) REFERENCES db_clti.tb_posto_grad(idtb_posto_grad);


--
-- TOC entry 2965 (class 2606 OID 16972)
-- Name: tb_pessoal_ti tb_pessoal_ti_idtb_corpo_quadro_fkey; Type: FK CONSTRAINT; Schema: db_clti; Owner: postgres
--

ALTER TABLE ONLY db_clti.tb_pessoal_ti
    ADD CONSTRAINT tb_pessoal_ti_idtb_corpo_quadro_fkey FOREIGN KEY (idtb_corpo_quadro) REFERENCES db_clti.tb_corpo_quadro(idtb_corpo_quadro) NOT VALID;


--
-- TOC entry 2966 (class 2606 OID 16977)
-- Name: tb_pessoal_ti tb_pessoal_ti_idtb_especialidade_fkey; Type: FK CONSTRAINT; Schema: db_clti; Owner: postgres
--

ALTER TABLE ONLY db_clti.tb_pessoal_ti
    ADD CONSTRAINT tb_pessoal_ti_idtb_especialidade_fkey FOREIGN KEY (idtb_especialidade) REFERENCES db_clti.tb_especialidade(idtb_especialidade) NOT VALID;


--
-- TOC entry 2963 (class 2606 OID 16962)
-- Name: tb_pessoal_ti tb_pessoal_ti_idtb_om_apoiada_fkey; Type: FK CONSTRAINT; Schema: db_clti; Owner: postgres
--

ALTER TABLE ONLY db_clti.tb_pessoal_ti
    ADD CONSTRAINT tb_pessoal_ti_idtb_om_apoiada_fkey FOREIGN KEY (idtb_om_apoiada) REFERENCES db_clti.tb_om_apoiadas(idtb_om_apoiadas) NOT VALID;


--
-- TOC entry 2964 (class 2606 OID 16967)
-- Name: tb_pessoal_ti tb_pessoal_ti_idtb_posto_grad_fkey; Type: FK CONSTRAINT; Schema: db_clti; Owner: postgres
--

ALTER TABLE ONLY db_clti.tb_pessoal_ti
    ADD CONSTRAINT tb_pessoal_ti_idtb_posto_grad_fkey FOREIGN KEY (idtb_posto_grad) REFERENCES db_clti.tb_posto_grad(idtb_posto_grad) NOT VALID;


--
-- TOC entry 2967 (class 2606 OID 16984)
-- Name: tb_qualificacao_ti tb_qualificacao_ti_idtb_pessoal_ti_fkey; Type: FK CONSTRAINT; Schema: db_clti; Owner: postgres
--

ALTER TABLE ONLY db_clti.tb_qualificacao_ti
    ADD CONSTRAINT tb_qualificacao_ti_idtb_pessoal_ti_fkey FOREIGN KEY (idtb_pessoal_ti) REFERENCES db_clti.tb_pessoal_ti(idtb_pessoal_ti) NOT VALID;


--
-- TOC entry 2960 (class 2606 OID 16957)
-- Name: tb_servidores tb_servidores_idtb_om_apoiadas_fkey; Type: FK CONSTRAINT; Schema: db_clti; Owner: sisclti
--

ALTER TABLE ONLY db_clti.tb_servidores
    ADD CONSTRAINT tb_servidores_idtb_om_apoiadas_fkey FOREIGN KEY (idtb_om_apoiadas) REFERENCES db_clti.tb_om_apoiadas(idtb_om_apoiadas) NOT VALID;


--
-- TOC entry 3138 (class 0 OID 0)
-- Dependencies: 201
-- Name: TABLE tb_admin; Type: ACL; Schema: db_clti; Owner: postgres
--

GRANT ALL ON TABLE db_clti.tb_admin TO sisclti;


--
-- TOC entry 3140 (class 0 OID 0)
-- Dependencies: 202
-- Name: TABLE tb_cidade; Type: ACL; Schema: db_clti; Owner: postgres
--

GRANT ALL ON TABLE db_clti.tb_cidade TO sisclti;


--
-- TOC entry 3142 (class 0 OID 0)
-- Dependencies: 204
-- Name: TABLE tb_clti; Type: ACL; Schema: db_clti; Owner: postgres
--

GRANT ALL ON TABLE db_clti.tb_clti TO sisclti;


--
-- TOC entry 3145 (class 0 OID 0)
-- Dependencies: 205
-- Name: TABLE tb_config; Type: ACL; Schema: db_clti; Owner: postgres
--

GRANT ALL ON TABLE db_clti.tb_config TO sisclti;


--
-- TOC entry 3148 (class 0 OID 0)
-- Dependencies: 208
-- Name: TABLE tb_corpo_quadro; Type: ACL; Schema: db_clti; Owner: postgres
--

GRANT ALL ON TABLE db_clti.tb_corpo_quadro TO sisclti;


--
-- TOC entry 3150 (class 0 OID 0)
-- Dependencies: 210
-- Name: TABLE tb_especialidade; Type: ACL; Schema: db_clti; Owner: postgres
--

GRANT ALL ON TABLE db_clti.tb_especialidade TO sisclti;


--
-- TOC entry 3151 (class 0 OID 0)
-- Dependencies: 229
-- Name: TABLE tb_estacoes; Type: ACL; Schema: db_clti; Owner: postgres
--

GRANT ALL ON TABLE db_clti.tb_estacoes TO sisclti;


--
-- TOC entry 3154 (class 0 OID 0)
-- Dependencies: 211
-- Name: TABLE tb_estado; Type: ACL; Schema: db_clti; Owner: postgres
--

GRANT ALL ON TABLE db_clti.tb_estado TO sisclti;


--
-- TOC entry 3156 (class 0 OID 0)
-- Dependencies: 213
-- Name: TABLE tb_lotacao_clti; Type: ACL; Schema: db_clti; Owner: postgres
--

GRANT ALL ON TABLE db_clti.tb_lotacao_clti TO sisclti;


--
-- TOC entry 3158 (class 0 OID 0)
-- Dependencies: 215
-- Name: TABLE tb_om_apoiadas; Type: ACL; Schema: db_clti; Owner: postgres
--

GRANT ALL ON TABLE db_clti.tb_om_apoiadas TO sisclti;


--
-- TOC entry 3160 (class 0 OID 0)
-- Dependencies: 217
-- Name: TABLE tb_osic; Type: ACL; Schema: db_clti; Owner: postgres
--

GRANT ALL ON TABLE db_clti.tb_osic TO sisclti;


--
-- TOC entry 3162 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE tb_pais; Type: ACL; Schema: db_clti; Owner: postgres
--

GRANT ALL ON TABLE db_clti.tb_pais TO sisclti;


--
-- TOC entry 3163 (class 0 OID 0)
-- Dependencies: 231
-- Name: TABLE tb_pessoal_ti; Type: ACL; Schema: db_clti; Owner: postgres
--

GRANT ALL ON TABLE db_clti.tb_pessoal_ti TO sisclti;


--
-- TOC entry 3166 (class 0 OID 0)
-- Dependencies: 219
-- Name: TABLE tb_posto_grad; Type: ACL; Schema: db_clti; Owner: postgres
--

GRANT ALL ON TABLE db_clti.tb_posto_grad TO sisclti;


--
-- TOC entry 3168 (class 0 OID 0)
-- Dependencies: 233
-- Name: TABLE tb_qualificacao_ti; Type: ACL; Schema: db_clti; Owner: postgres
--

GRANT ALL ON TABLE db_clti.tb_qualificacao_ti TO sisclti;


--
-- TOC entry 3173 (class 0 OID 0)
-- Dependencies: 223
-- Name: TABLE tb_tipos_clti; Type: ACL; Schema: db_clti; Owner: postgres
--

GRANT ALL ON TABLE db_clti.tb_tipos_clti TO sisclti;


-- Completed on 2020-05-22 12:40:52 -03

--
-- PostgreSQL database dump complete
--

