Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776503;
	b=FyHoiVaZ9GkjsVUZjPtiB/ogAbmtPIgieC/Qt2aTYhrCSn7tymnSq99GPrVgFrum7RO6
	 YVJ6SrfsTfwocYML2FvEUtwk2PlFs+64CHtwxdzBccXnor8U97WD3WY6k0JqEby9uWs+7
	 49VfDSHnHkn1AFp08OsGnVQXuFa9Smr4SKQ/tl7yyOZJto5fXDKMDzR69NLYqFX/OJHT6
	 YbM/L2JqYAu3sZKVb2iXFBPedyd9bU29AYgvTFZamvg920O3BvtYpIgLBNWKSZ9h68pAn
	 RhUNPY6DILOKBHw4SQGY0qpG6qJdx3wqqKo1YXYR2on2GXfERuBapUyqrGePRyPLU3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776503;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=vyJGav02XTLd6GFom/QYhBFJM2kW8LNFSesT5dVTI/s=;
	b=XhJimHcnEde3j7sY0AZfIhuRuJ6r+ad3ThOg9WX+IQdA2cx7Y/4LHnojT/AStocjd7KB
	 PyBh+xeXHL0qD30sUTJSTsQUz5zEK1WY4sDP4Be19q4OdPw6RntLxHVxyvbz2R+bAe60v
	 RGQFj/RrGhCRyVhxUBCd0Keuoq6VYC+lPZv1Rw6wtJ3zMH+nW79z5kMXZOnuvJWxOPH9j
	 JjvE0IKNjyNGMCShuxrmXwbeAWnJsukhU+5vAtU0eZDTvpyFwUFmP2SWLQdBp0cMzbTlo
	 ygb+Teq/Qqm2BTtJxn3xF92pRr2E7b1wMP2SRMtGc0vA/F4d52LqqzM80Jjoxb0n/dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=fejes.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3462606A31F
	for <perfbook@vger.kernel.org>; Sun, 15 Nov 2026 21:01:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3462606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fejes.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-37628596783so4680281eec.1
        for <perfbook@vger.kernel.org>; Sun, 15 Nov 2026 13:01:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776502; x=1795381302;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vyJGav02XTLd6GFom/QYhBFJM2kW8LNFSesT5dVTI/s=;
        b=C/e/wlyLvPU2vr1B1mVGkxF3vAhqzsUX4Pw7fAZ7p++yyzeML6o7vtP+TAi6zGg4yY
         fDaO9Wr7NDZUFZ5b8Oty7NjDy33Mf+NPf8NJbHwNhpwGi8WBWNF6j8Xag/Gu5ub/C3z/
         uqBzwrnggDlLA/14F7/r+9XJa1M2tjMhA8aN7MJTMilHvDUFlESrJvYstIeBjnZBrwC7
         ewQazozIvZmApAqhvo1bV47dI1BcjJkNXMkdcRo75QWDMahDZiizh8Pn2BVOlqDO6CwN
         BDFAKmxO8Xa6LW9XfSjvaxEyegtC4Jpp6ppoNzxoBsAIcwXhJ/cwKOEnRe59Z3u3WRAv
         9Zdg==
X-Gm-Message-State: APuU4Z+6/G5Wkp9BGJVa+K6p9QktKBmeNM6U3gb/Sl3UPE+QCp/Wj6EU
	ENMz8CIZI4X5hxloKVanoKRH++D8GhnbyE1VNmLKeIvLtH8jQGitJ+rrmFxu3BGPWolrPAEY
X-Gm-Gg: AYBFou2cAcZtjNt2DmWdbyHVxM5SihJd/APEsg0Ag1igu9QVYTIeaABXIh9ejpNFAYL
	2/D+p3aBmPgWip0kl0q5ZeFKLwqVQuUMrGScTq0796V3MJmdNk++SNL3dx3wRSMrNpHUeFJ+pvC
	SMxnRTuFIsfGkjbJcWngf/Z0JTcGyvNKC+FBbj9ZD6Tj/Pufs8PPHoeLQZi7uK9U2GdnPJR+PXC
	3hh0z00mk6XcfTvrT2jIAjz8qCb85HaoLZ9lczRMQ7JNYKL8N/P5e+WXjHQYe8TgayOSKDnnGyA
	qfpYEoh7N3mNFCn2o60jPDKQW7SW7dQItYTNWFtlsxrT5nXMd9ajpSt/sqywh+y/LRpSU9/7IKn
	+LmdHc02svIQzBSWzbv6VQBVrIVb353G5qC8mlX1n8HIo73b8wfknh2ArWjbQHt6Vor7H3Ayack
	khAmX9Pa1epKzetPY6P1+IS+jlwb3I/C3S9QANhTLraVVktp4xoIX3Z/zfr/uAHQTHa051PY+6m
	uSDZjTXeba9PPCtXJk7HxI49dRIeHFGmEpBVqi/jdv91rlNcFI0ZKx+ILkYluuhWKgJqqEl3F7F
	/xFw37SqXR+VdIlTOGnOGTz9fmjduuVOJtHOL0hYKskXWMzXtk2/RtMt4VDfw88UVo3RGm5qJbI
	oxzN/6rU1fo7YSZ45JkBozO51YCr8t4pAHp0r002VsAsZ83XGpnfu981CQKa5q4+H1HZ5cZhoil
	yJ7NSuuDYH5+tXBwEclHgl45CqnX3sKR4DHA4+pRg=
X-Received: by 2002:a05:7300:ce12:b0:37b:dbd0:ba63 with SMTP id 5a478bee46e88-37bdbd0ba97mr3587328eec.3.1794776501513;
        Sun, 15 Nov 2026 13:01:41 -0800 (PST)
Received: from hp.tailca3b3b.ts.net ([2001:67c:370:128:4595:f7da:56c1:448d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm26926677eec.22.2026.11.15.13.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 13:01:41 -0800 (PST)
From: Ferenc Fejes <ferenc@fejes.dev>
To: perfbook@vger.kernel.org
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Leonardo Bras <leobras.c@gmail.com>,
	Ferenc Fejes <ferenc@fejes.dev>
Subject: [RFC PATCH 0/7] Add reflowable HTML and EPUB3 build target
Date: Sun, 15 Nov 2026 22:01:31 +0100
Message-ID: <20261115210138.229034-1-ferenc@fejes.dev>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Post: <mailto:perfbook@vger.kernel.org>
List-Help: <mailto:perfbook+help@vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
List-Owner: <mailto:perfbook+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi!

This RFC series adds experimental reflowable EPUB3 and HTML build targets
("make epub", "make epub-endnotes", and "make html") derived from the
ebook-size variant via TeX Live's lwarp package and Pandoc, without
modifying any of the book's existing .tex or .sty files.

Overview of the pipeline:

- reflow.ltx hooks into the generated perfbook-epub.tex wrapper to adapt
  print-oriented macros, listings, tables, figures, equations, footnotes,
  Quick Quizzes, and cross-references for HTML/EPUB output.
- Makefile stages SVG figures in parallel under epub-figs/ and invokes
  utilities/runlwarp.sh to run lwarp, render math SVGs via lwarpmk,
  package the chapter-split EPUB3 with Pandoc, and run structural
  validation checks (plus epubcheck when installed).
- utilities/epub-fixhtml.pl and utilities/epub.css perform post-Pandoc
  XHTML/SVG/CSS adjustments tested in KOReader and Foliate, including
  EPUB3 popup footnotes and Quick Quiz answers (and a plain endnote
  variant in perfbook-endnotes.epub for readers without popup support).

This is an RFC so I would be happy to hear ideas how I can improve this
experiment. Few things:

1. Does this non-invasive lwarp + Pandoc approach look acceptable for
   maintaining experimental EPUB support alongside the PDF builds?
2. Is it worth keeping both perfbook.epub (popup footnotes/quizzes) and
   perfbook-endnotes.epub (linked chapter endnotes), or would a single
   target be preferable?
3. Are the Dockerfile package additions and non-blocking GitLab CI job
   (allow_failure: true) aligned with how you would like this tested?

AI: This RFC generated by language models and I verified the result on
my physical epub reader and on Linux in Foliate and KOReader epub
readers. I used several models and refined the set for months, and with
the latest and greatest frontier I was unable to trim ot further. The downside
of this work is that I cannot tell with full confidence this is the
simplest form. With more knowledge it might be improved further.

I tried three approach to get to a working epub target:
- tex4ht: it required heavy modifications of the already existing LaTeX
  source so I abandoned this approach. After aroung 2k LoC change it was
  able to produce a reasonable HTML and ePUB, but it was too intrusive
  for my taste
- lwrap (this one): this felt the best and required the least change
  compared to the upstream. It hooks into the build flow in the right
  spot so no changes required in the upstream LaTeX code
- LateXML: this is what arXiv uses to compile the paper sources to HTML
  and they improve it in quite a fast pace. This target was intrusive
  and a reasonable looking output required many small changes in the
  upstream source and what worse, in the LateXML toolchain. I abandoned
  this approach as well
These trials executed 2-3 months ago, and lwrap was the winner, but
models might improved since making LateXML feasible. In the past months
I only improved the lwrap based approach, resulting this RFC.

Thanks,
Ferenc

Ferenc Fejes (7):
  reflow.ltx: Add LaTeX-to-HTML shims for lwarp builds
  utilities: Add EPUB3 post-processor and stylesheet
  utilities/runlwarp.sh: Add lwarp and Pandoc build driver
  Makefile, .gitignore: Add epub and html build targets
  epub: Add endnote variant for readers without popup footnotes
  FAQ-BUILD.txt: Document HTML and EPUB build targets
  docker, gitlab-ci: Add EPUB build dependencies and CI job

 .gitignore                |  14 ++
 FAQ-BUILD.txt             |  45 ++++++
 Makefile                  |  68 ++++++++-
 docker/Dockerfile         |   2 +-
 reflow.ltx                | 255 ++++++++++++++++++++++++++++++++
 utilities/epub-fixhtml.pl |  93 ++++++++++++
 utilities/epub.css        |  63 ++++++++
 utilities/gitlab-ci.yml   |  17 +++
 utilities/runlwarp.sh     | 299 ++++++++++++++++++++++++++++++++++++++
 9 files changed, 852 insertions(+), 4 deletions(-)
 create mode 100644 reflow.ltx
 create mode 100755 utilities/epub-fixhtml.pl
 create mode 100644 utilities/epub.css
 create mode 100644 utilities/runlwarp.sh


base-commit: 94d572e236ab8e26fa79ff0776a3bba221647315
--
2.55.0

