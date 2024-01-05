Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAA124A05
	for <perfbook@vger.kernel.org>; Fri,  5 Jan 2024 09:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AqEuYL13"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6d9a795cffbso298451b3a.0
        for <perfbook@vger.kernel.org>; Fri, 05 Jan 2024 01:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704448638; x=1705053438; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vi9FBcrSz2D77a+DUk81pM8E0/U1ekou7EQ8KuqNF/A=;
        b=AqEuYL13Z/j3gy+QrITIHGi8CoCIbhX42mXkoTzBCZ9RPVpjvdxthDPZlvvY7kelSk
         h3mttRfKAEpX5bkO8uevWrm7LHu3gcljfIZ0R9aQ6uvfvOhrXuUu7R2rsnoZl7vqY04C
         4nfUCPWo824RMSqqmPDswnG0/I7VMq5ZHYlskB4Bt2+u/QzGOw52s2xNhiKI1H/GHj52
         fta8H/4xjAek54frfI4q6VGs6PaJBSNkNhDJzNlHLicbQr85aM1OXSj4AtihXrTCBQZP
         CgLjPaqNH/bOWqrAclLRDWLO7fpI0a+8ZowZjQVkiRkSvAic5F4XDxGNRx/cEjyuQIJe
         EJUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704448638; x=1705053438;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vi9FBcrSz2D77a+DUk81pM8E0/U1ekou7EQ8KuqNF/A=;
        b=BRY97fxAen+Ox+PTh3tz3FJeSPTQANt/uJGpbiCnsRE2woL1Zub+ONjy25qxjuHJ6Z
         F6U3Pyfe4+eSc2HPIRBhl2VvUIfSwJKFEu/3vlZkPFPFzJOVZVMOU09iT2YeJXUey8XT
         VnR9tHD+IU5OOuq8CHfIyqAQXr1JKxm/73zlgGtXqNgWnOTJiNx+d1jKVLf5GkbB29Ah
         4cfJFqWsb5sfyheD1bHnMWy3ImagzIrUe7YvZRjAfN44tLXcBHhBxGZF/g0/LXgTGog6
         ZVHIf0CFXmWqFp3mXvJpmgZ4qRrKmG0AyvfZ6BMQ2wi+THIavoXEQWIGzWx5IOnfD2tE
         6QSg==
X-Gm-Message-State: AOJu0YzEDIdicNKyLFX4mKDZU9xB85cWPzUStTOgAHAKj6WBOdRQEuni
	jfHzCkPRvxXBwqJZ7StQduI=
X-Google-Smtp-Source: AGHT+IFUVUkk07xlo0ekPsipCZFKVaV8O4ByBPb0qlnpeAcfEkWncbNhQqoQrTtnVbOi9z8ElXw0Ow==
X-Received: by 2002:a05:6a00:3c8a:b0:6d9:a074:659f with SMTP id lm10-20020a056a003c8a00b006d9a074659fmr2409590pfb.13.1704448638512;
        Fri, 05 Jan 2024 01:57:18 -0800 (PST)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id z6-20020aa785c6000000b006da24e7c16dsm1029605pfn.186.2024.01.05.01.57.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jan 2024 01:57:18 -0800 (PST)
Message-ID: <4a766f7b-a239-459f-9d5b-ff64c6c28c2f@gmail.com>
Date: Fri, 5 Jan 2024 18:57:17 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 7/8] docker: Add packages for rsvg-convert
Content-Language: en-US
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <8d0ffcdc-59f9-49ef-b8e1-313e71cac913@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <8d0ffcdc-59f9-49ef-b8e1-313e71cac913@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Make rsvg-convert available in these container images.

Also go forward to Fedora 39 as the regression of font info corruption
observed in Fedora 38 has been resolved.

Keep inkscape as well so that the resulting container images can work
on top of Git repos before January 2024.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 docker/Dockerfile        | 4 ++--
 docker/Dockerfile.fedora | 7 ++-----
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/docker/Dockerfile b/docker/Dockerfile
index ec89c6f2..66fd2b3f 100644
--- a/docker/Dockerfile
+++ b/docker/Dockerfile
@@ -1,7 +1,7 @@
 ARG rel=latest
 FROM ubuntu:$rel
 
-RUN apt-get update && apt-get install -y locales && \
+RUN apt-get update && apt-get upgrade -y && apt-get install -y locales && \
     localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 && \
     rm -rf /var/lib/apt/lists/*
 ENV LANG en_US.utf8
@@ -9,7 +9,7 @@ RUN apt-get update && DEBIAN_FRONTEND=noninteractive TZ=UTC apt-get install -y t
     rm -rf /var/lib/apt/lists/*
 RUN apt-get update && apt-get install -y fig2ps inkscape xfig graphviz psutils \
     texlive-publishers texlive-pstricks texlive-science texlive-fonts-extra \
-    make nano vim git curl gnuplot-nox time poppler-utils && \
+    make nano vim git curl gnuplot-nox time poppler-utils librsvg2-bin && \
     rm -rf /var/lib/apt/lists/*
 COPY steel-city-comic.regular.ttf /usr/local/share/fonts/
 RUN fc-cache /usr/local/share/fonts/
diff --git a/docker/Dockerfile.fedora b/docker/Dockerfile.fedora
index 5eff2a2a..6812163a 100644
--- a/docker/Dockerfile.fedora
+++ b/docker/Dockerfile.fedora
@@ -1,15 +1,12 @@
-# As of June 2023, Inkscape of Fedora 38 has a regression of font markup
-# corruption.
-# Stay with Fedora 37 for the moment.
 # You can override "rel" by saying:
 #    docker build -t <tag> --build-arg rel=latest -f Dockerfile.fedora .
 #
-ARG rel=37
+ARG rel=latest
 FROM fedora:$rel
 
 RUN dnf -y update && dnf install -y --setopt=tsflags=nodocs \
     fig2ps graphviz inkscape make git vim nano gnuplot-minimal groff time \
-    liberation-fonts dejavu-fonts-all poppler-utils \
+    liberation-fonts dejavu-fonts-all poppler-utils librsvg2-tools \
     texlive-collection-plaingeneric texlive-collection-binextra \
     texlive-collection-latexextra texlive-epstopdf texlive-fontools \
     texlive-newtx texlive-newtxtt texlive-nimbus15 texlive-courier-scaled \
-- 
2.34.1



