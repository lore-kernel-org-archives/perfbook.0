Return-Path: <SRS0=Gk1L=CD=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686822890; x=1689414890;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bMukAul6ezNindmlypaPI7ZIRm3eFLiJAMHS/t1zGAI=;
        b=f7L5ObQhZ4VBmzLEIGGeg93tQ2OvxiX944s/uQGa0YhvhuMdTORK1vFduCeAnIyKXO
         wXSMhDNVJdtP8qj78UjjMffAA2UHn4KCaKO4DIU8YF1DuBenUOidNdlMfgL79TqQJAk3
         OnPSLYP4XOJ9QDthEZiP0eJkCagsgyOpRNqyRV9Uuu37eW8eQk6kZAXMC+VDdBc6jm0R
         /Fc453Nc4NzFZ/o0hB9IeR7DK2yFDlMvuAmFJcPtMzkASD49P5ocb3C3vaTLb4UR+d7a
         GhxGgyU3Tni78XD34sSXGfieDMVIR0pSPfWuda86TpBUU8MiR+XWS+nF/Ptn6LDrxL7O
         vu8g==
Message-ID: <d210abbd-9578-dc34-ba8e-5973bc86f209@gmail.com>
Date: Thu, 15 Jun 2023 18:54:48 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 5/6] docker/Dockerfile: Add poppler-utils package
Content-Language: en-US
References: <feeecfa4-ed23-bede-5487-49129030431f@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <feeecfa4-ed23-bede-5487-49129030431f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Font markup info in PDF properties can be printed by the pdffonts
command provided by the poppler-utils package.

Add it for catching possible regression in Ubuntu's Inkscape.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 docker/Dockerfile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docker/Dockerfile b/docker/Dockerfile
index faa0a0fb5a31..b11116493c6d 100644
--- a/docker/Dockerfile
+++ b/docker/Dockerfile
@@ -9,7 +9,7 @@ RUN apt-get update && DEBIAN_FRONTEND=noninteractive TZ=UTC apt-get install -y t
     rm -rf /var/lib/apt/lists/*
 RUN apt-get update && apt-get install -y fig2ps inkscape xfig graphviz psutils \
     texlive-publishers texlive-pstricks texlive-science texlive-fonts-extra \
-    make nano vim git curl gnuplot-nox time && \
+    make nano vim git curl gnuplot-nox time poppler-utils && \
     rm -rf /var/lib/apt/lists/*
 COPY steel-city-comic.regular.ttf /usr/local/share/fonts/
 RUN fc-cache /usr/local/share/fonts/
-- 
2.25.1


