Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=etOerkldFoBQ7PVjuDyfppLsBl+gNsqRUew41KV0csk=;
 b=s5f+uatKn0NSSZMncMjVZnj28MtU+/zEDeLlUTAmkJZkpbv7U6TzcotEjHosng9rXJ
 O5baoJsqu0egqnOy3yK7PaDddJId9SNRS2rP6m7BW77oxqS4eHp3/RJN5K9Sr3+CaXz0
 Hheae0DI25eecmI5vb/J5O+yvZFymGEMpPo5vw3kx+CbqNv0S5HMjwdfmeseNlGg2oyc
 QKpLR7dQvA92oWw6MRnzMa0n+qg+RyxFHw2fmbElNTJYdFNrfO26/Y+qOvtPlQmkh/LX
 y3VLta7KAicFdEwas2x/WQDzAIIbkATidQPvLk/OwWv01bgQR/N+RZoeH1XYzh8MVFPi
 VtbA==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 2/2] FAQ-BUILD: Add package requirements for Fedora 24
Date: Tue, 16 Aug 2016 10:16:52 +0900
Message-Id: <1471310212-4354-2-git-send-email-sj38.park@gmail.com>
In-Reply-To: <1471310212-4354-1-git-send-email-sj38.park@gmail.com>
References: <1471310212-4354-1-git-send-email-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This commit adds package requirements for Fedora 24.  It has been tested
on `fedora:24` docker image.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 FAQ-BUILD.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index d2c5352..6627bbb 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -43,6 +43,11 @@
 			texlive-science texlive-bibtex-extra latex2html
 			gnuplot-x11 xfig inkscape graphviz fig2ps

+		On Fedora 24, installing the following set of packages
+		suffices:
+			fig2ps graphviz texlive-epstopdf inkscape latex2html
+			texlive-collection-latexextra
+
 		Other systems might provide similarly named packages.
 		For example, Doug Miller noted that the following list
 		of teTeX components worked for him on RHEL5:
-- 
1.9.1

