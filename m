Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776509;
	b=hyRItvWQZXVxPsm2moEaLvjdoFAhdpge66TVvKfUTkQ4Kx8mJizYft0yI3ypRSjL/dL8
	 bO4sULYyyVrRBFCJ+llaxP0UG8B8Qs2h9M6P7+ytXtHGLNFn1DhsbzarTtwYki7CZZUUB
	 hr/YmUOsDtcoJXOMj74VeTH4rmGuZoM/ffxs0r+ojE0Tov+UWOgYg9WC9sdSQFCIDz17t
	 sxfVPwnas+4edsJwRTVuUE6A+LtDWnkRZGc02b49pSp+bAOgXdCskMFOdVOrzrJ5vv6t8
	 gAIljvOwLZWc13hCj48VC80vFMvxvIa/tzNJCwScZjMRjBFnbdxiPMWokKsmCQYYcqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776509;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/Dd1TbjTgIWemuNhMqUOuiP7KiL6gPxWcaQALcZt7J4=;
	b=PXkOIZzBqFR+8fv25mHuPSxIYfmJ5CY2zNuudejgDu+uzMLczf9QaSeKM1oZ5tDXCx0k
	 9PkgOIBQMbRokYNvq26hLZtp6tWSsrRN8dws4zi+a7DOZwxiIAU/JHI18rU1NNr9q4IzB
	 bR6I2dZeaamPEpk2vAkCHnaV2BFaaIDdzenQsznHuoSRU8f3DUKrSOAikaTmdiTaLu+vC
	 iZAaZ1lJs5lVP1xatLjHohThm6VBSpBFbscmftyOBES5Xh8P/PED2hHGiNdIgvocKr72W
	 gwc2eNQLBM8od8ZJvHYlaNqZRh6W7mJ3qmEexFdDSZT5HxN2GYmbMUsd+ttHK77YSHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=fejes.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741ED606A32F
	for <perfbook@vger.kernel.org>; Sun, 15 Nov 2026 21:01:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 741ED606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fejes.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33fb4680717so7820517eec.1
        for <perfbook@vger.kernel.org>; Sun, 15 Nov 2026 13:01:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776509; x=1795381309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Dd1TbjTgIWemuNhMqUOuiP7KiL6gPxWcaQALcZt7J4=;
        b=0MntgDH1vj1cJVoeyVLcgcvSbIaVEZ0jYbWIQIddTfuBviVEObedY7rDyhCYsDrSgT
         IDVSs1rN4+JBqlExQ3K7gSxIzFkvFw/uzahyTz31tugnAVhnS8oxjiR+AFPSc9aSgA/O
         zaY6AUqCBTHjTMfA3S4apSdMG/adHoF3PiMtSQOuDbMLTm0mee0SHMaI4rVi4DFiyZGm
         AeIy1DLQ9aC4/VY1+fs5eKYeH5Lk9XzC7PRFhzpsAV7bjiDbacITsv4b3HVgNQSmwPND
         v2Y316maADpYod2duV29XbFqoyuWbGgtA/DtgaVu/4rowu61UKJB5Ywux76uy1YqHX9m
         htLg==
X-Gm-Message-State: APuU4Z8kZ/K5t8uVvJ71S0yMIPsKY34nsL3sriQexa+9lKoUNyxAlyPy
	mz6wI6I+C1MagDbxpqrgUug6vqtLRjao8FNbw7bTzMYGkQYTLu6lacq18EjZCGFMrA5NMtf8
X-Gm-Gg: AYBFou0KtQGcbbnsQ5wm5k19rYixuAq6YrkDsJD6HSJ2k9E2PnKdsDYI/GXTnsl0nQo
	UYkZpk9lm5l2tV89RVQA4+PVzUZhwe2fLj1K/ckiyMFghfY5T3q4bfDXzKnsh6eblXCLU8AnTYg
	hZDLc0w4nmfEzRjxaWIl5FvmDwf2Vnym5oLFnjasMUP3RElDmFVdeLSJi/1S0TduhIhnNS4fZDk
	btk4v6pS0d/Isw3cmGg900vyK4yv1fu6cXa/3o0KBuW3hx1/dlajX2BlURRF51Cm34U1J0aDPn2
	iLKWK4c0imRZ/QpvD4CX6JIJ2c2+/5nCjnmSkR0BAdni9ideY+YFyfqnpLx40KBWRLCXyJVJn9r
	apXAm6LXQAHypLfrQ8EGgFBUNiCOW1j4LY12zFlRBQgfRFzc5rraBWnSD6af8amBV6Phho26MXi
	E4uWKQfa0HAEmf6NNcRySWp1TtfhVWWedt+yDg9cO4+rndWoBWxyKgLMjtky17a38LwTGw3KXlD
	63bT+E9HfbvWXOt4A0YXy4b3EJhxV+o/ovyo0OUzS9TZ8UvBYxiIf1zvS8OIn+UZKae/MWeZfUw
	Snnhpy4Xgj4D5fvYEVjDeqmAB2g8sHsoFmbQiu2bd3A8WabAYRKTDBVF5cmFClQD0EQdP1NNZjG
	HgFywmc2xwvmy8Ecse4keW6pByKfKcDwxtb/wKLIusLUv3FiamOFN5oNjSz4mbCgkkBO9vI/JZB
	t1MVPKnP1qdpIYNJNbB5/KagKsSEw2959G5QfUJqB+sLsmWI2woks4a4tNB7XD
X-Received: by 2002:a05:7300:dd03:b0:36a:437a:4c00 with SMTP id 5a478bee46e88-37967314a08mr7968556eec.24.1794776508456;
        Sun, 15 Nov 2026 13:01:48 -0800 (PST)
Received: from hp.tailca3b3b.ts.net ([2001:67c:370:128:4595:f7da:56c1:448d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm26926677eec.22.2026.11.15.13.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 13:01:47 -0800 (PST)
From: Ferenc Fejes <ferenc@fejes.dev>
To: perfbook@vger.kernel.org
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Leonardo Bras <leobras.c@gmail.com>,
	Ferenc Fejes <ferenc@fejes.dev>
Subject: [RFC PATCH 7/7] docker, gitlab-ci: Add EPUB build dependencies and CI job
Date: Sun, 15 Nov 2026 22:01:38 +0100
Message-ID: <20261115210138.229034-8-ferenc@fejes.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115210138.229034-1-ferenc@fejes.dev>
References: <20261115210138.229034-1-ferenc@fejes.dev>
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Post: <mailto:perfbook@vger.kernel.org>
List-Help: <mailto:perfbook+help@vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
List-Owner: <mailto:perfbook+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Install pandoc, unzip, zip, and texlive-lang-japanese in
docker/Dockerfile for EPUB builds.  Add a non-blocking generate_epub job
in utilities/gitlab-ci.yml that builds and archives perfbook.epub and
perfbook-endnotes.epub.

Signed-off-by: Ferenc Fejes <ferenc@fejes.dev>
---
 docker/Dockerfile       |  2 +-
 utilities/gitlab-ci.yml | 17 +++++++++++++++++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/docker/Dockerfile b/docker/Dockerfile
index ee120e4b..063a678b 100644
--- a/docker/Dockerfile
+++ b/docker/Dockerfile
@@ -9,7 +9,7 @@ RUN apt-get update && DEBIAN_FRONTEND=noninteractive TZ=UTC apt-get install -y t
     rm -rf /var/lib/apt/lists/*
 RUN apt-get update && apt-get install -y fig2ps inkscape xfig graphviz psutils \
     texlive-publishers texlive-pstricks texlive-science texlive-fonts-extra \
-    make nano vim git curl gnuplot-nox time poppler-utils librsvg2-bin && \
+    make nano vim git curl gnuplot-nox time poppler-utils librsvg2-bin pandoc unzip zip texlive-lang-japanese && \
     rm -rf /var/lib/apt/lists/*
 COPY steel-city-comic.regular.ttf /usr/local/share/fonts/
 RUN fc-cache /usr/local/share/fonts/
diff --git a/utilities/gitlab-ci.yml b/utilities/gitlab-ci.yml
index f03e39a9..6068b215 100644
--- a/utilities/gitlab-ci.yml
+++ b/utilities/gitlab-ci.yml
@@ -31,3 +31,20 @@ generate_pdfs:
           - perfbook.pdf
           - perfbook-1c.pdf
           - perfbook-eb.pdf
+
+generate_epub:
+    stage: build
+    allow_failure: true
+
+    before_script:
+        - pacman --noconfirm -Syu texlive-meta fig2dev ghostscript graphviz librsvg gnuplot wget make which fontconfig git ttf-dejavu gnu-free-fonts ttf-liberation pandoc poppler texlive-langjapanese unzip zip epubcheck
+        - mkdir -p ~/.local/share/fonts && cp fonts/steel-city-comic.regular.ttf ~/.local/share/fonts/ && fc-cache
+
+    script:
+        - source /etc/profile
+        - make epub epub-endnotes
+
+    artifacts:
+      paths:
+          - perfbook.epub
+          - perfbook-endnotes.epub
-- 
2.55.0

