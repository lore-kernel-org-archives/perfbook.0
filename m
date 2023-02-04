Return-Path: <SRS0=PvuL=6A=gmail.com=leobras.c@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CP2PI4fzGHqTv8I5gp7T0YPJutIzoKRt5NoomOeQZv0=;
        b=Lm3Fpp5lAPME1YTQVhfXCglNU3Gp3T56yqbiaD2rrmKtEkdh+hA4XlKcFjPo0ZajGW
         6/y2jiRbCNsKR7Zw5jOyWIgQlwGTgjpJ16T203RV5EIKQaZHAW3A1TNqHt3+/fgkfNeS
         H4ZxseSrE1L532kDaSYW5ZMxxW1K5jZ3Lb7BeuCBHP1F98dLbgVA7TqAKqfR5EeBrqgJ
         zfrk/Ir3pyN4y/RJQhcwMpPvWEdlskePaonDgkn2t8OQVWUxHD4kF5G0DL3jyISfGzzT
         cTg9yAd2xCB+/aXWI5kRoc+on87Gl55FaIHDNpYSRdKPseJ6CdYDPfoqrXDb2c5RLUVS
         tmLw==
From: Leonardo Bras <leobras.c@gmail.com>
Subject: [PATCH v1 2/2] utilities/gitlab-ci.yml: Add 'make check' on test_codesamples
Date: Sat,  4 Feb 2023 00:36:27 -0300
Message-Id: <20230204033627.67980-2-leobras.c@gmail.com>
In-Reply-To: <20230204033627.67980-1-leobras.c@gmail.com>
References: <20230204033627.67980-1-leobras.c@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org
Cc: Leonardo Bras <leobras.c@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Call make -C CodeSamples/ check on test_codesamples, so any runtime error
can be detected by Gitlab-CI.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 utilities/gitlab-ci.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utilities/gitlab-ci.yml b/utilities/gitlab-ci.yml
index f2cb1c8e..7f50f12a 100644
--- a/utilities/gitlab-ci.yml
+++ b/utilities/gitlab-ci.yml
@@ -12,6 +12,7 @@ test_codesamples:
 
     script:
         - make -C CodeSamples/
+        - make -C CodeSamples/ check
 
 generate_pdfs:
     stage: build
-- 
2.39.1

