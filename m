Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748AC250FA
	for <perfbook@vger.kernel.org>; Fri,  5 Jan 2024 09:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B0UzlunT"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6d9cb95ddd1so692138b3a.1
        for <perfbook@vger.kernel.org>; Fri, 05 Jan 2024 01:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704448725; x=1705053525; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UZiiAdAEpZX9YKoDUfeZXFDvOqRX8XOlJ16lbkK6qkA=;
        b=B0UzlunTDBrjAKe8aOlvjfDWqIoUfPOfwszyNGyrKi6ehCFeql8PB8nLuvkYcsUW/G
         q54fZuf8yUnajrVT39Z3W4VAfy3/aSVyKf8ULGJaj+Z8WoPECPvGpWT8RzWZX0ymKsJV
         kJj2U+uM32/IUTgcFIaMu4YLPYApBYzpf0Alwkq0FM12nljjwZHjj8GNqQSeKcUdEtxj
         CtiNeNzy2W77C5vH20IUGor8h2/MiOVYIllBGt0nwjwPwv06V1Y0vqonmTn3dQtehwg+
         G7UXNuPxIH0GT2aE8OMsGs64cc1S33NVkLqk857lDOa3yLj6ghO4zFYUxPPdXdih8k0m
         ejUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704448725; x=1705053525;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UZiiAdAEpZX9YKoDUfeZXFDvOqRX8XOlJ16lbkK6qkA=;
        b=Ons10LtoxgGOXVz4RyhYetELxF7/evfSOrh71u5X1GCet9K1HArrLQSdZd7JLob8OG
         qco4fi8aqnamnnKGd2rZjasa+YRKOZ3Vep9PvAXJsQ7D8sKjrNF5WpFUhUD8oVSAw5vu
         UDNWNXXswLcU7u9MFC2RbKhykQPVwwYIzcadNy1o0iCAcnKhEpr+sumiUtRH5lZ66nrL
         CAE8ZIffSsJXLu8WdzSW3dfr2gR3rsXgvYRO5KBjC8O3QjdNxbwG7J+qiU5lKBvSWECo
         SWau33ALdgwFTGP1aMW63NP2XJTWGlCcgFYkrGFIeeNcWkTHWoIL8/WYTVT/1yfWvFsj
         neMQ==
X-Gm-Message-State: AOJu0Ywe8uikWmxvI2dXsW9IMuDF8F11+x0QMK9ptnhLjzsNLcowdTCg
	DCe5YUEUMfz+Nr2jMay/ILQ=
X-Google-Smtp-Source: AGHT+IGt1wa6czbZGDWoUDev6v9D1JmsCVYRY6bPaG0XuJMuDqYLRlkpeKTakl6CyA4dt4KWkZhmxg==
X-Received: by 2002:aa7:8399:0:b0:6d9:acea:bdce with SMTP id u25-20020aa78399000000b006d9aceabdcemr1914991pfm.24.1704448724676;
        Fri, 05 Jan 2024 01:58:44 -0800 (PST)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id z6-20020aa785c6000000b006da24e7c16dsm1029605pfn.186.2024.01.05.01.58.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jan 2024 01:58:44 -0800 (PST)
Message-ID: <07aca12c-85f9-4e8c-b0f6-1e502cdd8cc5@gmail.com>
Date: Fri, 5 Jan 2024 18:58:43 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 8/8] gitlab-ci.yml: Install librsvg instead of
 inkscape
Content-Language: en-US
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Leonardo Bras <leobras.c@gmail.com>,
 Akira Yokosawa <akiyks@gmail.com>
References: <8d0ffcdc-59f9-49ef-b8e1-313e71cac913@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <8d0ffcdc-59f9-49ef-b8e1-313e71cac913@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Arch Linux, rsvg-convert is provided in the librsvg package.
Install it instead of inkscape.

Using rsvg-convert can shorten runtime of CI job for building PDFs
a bit.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
Cc: Leonardo Bras <leobras.c@gmail.com>
---
Needs an explicit ACK or Tested-by from Leo.
Expected order of reduction of build time:  ~10s

 utilities/gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utilities/gitlab-ci.yml b/utilities/gitlab-ci.yml
index bcda8712..17525fb4 100644
--- a/utilities/gitlab-ci.yml
+++ b/utilities/gitlab-ci.yml
@@ -19,7 +19,7 @@ generate_pdfs:
     stage: build
 
     before_script:
-        - pacman --noconfirm -Syu texlive-meta fig2dev ghostscript graphviz inkscape wget make which fontconfig git ttf-dejavu gnu-free-fonts ttf-liberation
+        - pacman --noconfirm -Syu texlive-meta fig2dev ghostscript graphviz librsvg wget make which fontconfig git ttf-dejavu gnu-free-fonts ttf-liberation
         - mkdir -p ~/.local/share/fonts && cp fonts/steel-city-comic.regular.ttf ~/.local/share/fonts/ && fc-cache
 
     script:
-- 
2.34.1



