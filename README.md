# Site Estático na AWS com Terraform

Projeto prático para aprender a provisionar infraestrutura na AWS usando Terraform — hospedando um site estático no S3 e cloudfront.

> Ideal para quem está começando com IaC (Infrastructure as Code) e quer um projeto real no portfólio.

---

## O que você vai aprender

- Criar e configurar um bucket S3 para hospedagem de site estático
- Configuração de CDN com cloudfront
- Gerenciar permissões de acesso público com Terraform
- Subir arquivos para o S3 via Terraform
- Conceitos básicos de IaC com Terraform (resources, outputs, variáveis)

---

## Pré-requisitos

- Conta na AWS (free tier é suficiente)
- [Terraform](https://developer.hashicorp.com/terraform/install) instalado
- [AWS CLI](https://aws.amazon.com/cli/) configurado com `aws configure`

---

## Estrutura do projeto

```
.
├── main.tf       # Configuração do provider AWS
├── s3.tf         # Todos os recursos do S3
├── cloudfront.tf # Configuração do cloudfront
├── output.tf     # Output com a URL do site
├── index.html    # Página principal
└── error.html    # Página de erro 404
```

---

## Como executar

```bash
# 1. Clone o repositório
git clone https://github.com/seu-usuario/seu-repo.git
cd seu-repo

# 2. Inicialize o Terraform
terraform init

# 3. Veja o que será criado
terraform plan

# 4. Sobe a infraestrutura
terraform apply

# A URL do site aparece no output ao final
```

Para destruir tudo:

```bash
terraform destroy
```

---

## Recursos criados na AWS

- **S3 Bucket** — armazena os arquivos do site
- **Public Access Block** — libera leitura pública
- **Website Configuration** — habilita o modo site estático
- **Bucket Policy** — permite acesso anônimo aos arquivos
- **S3 Objects** — faz upload do `index.html` e `error.html`

---