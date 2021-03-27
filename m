Return-Path: <SRS0=yW6v=IZ=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+i/0DKPDFRNld0SMVXnbFxzNZR4HHFWnkH3JTyIs9ug=;
        b=JDAh5K0vYWEp01EKgkMlsgVpTqZnWhG+SH2rXXD0uCZZOkCrwuBxTtod85DmtWhQm+
         ExTXda7wYZVIB2bhckNhGImQ8+Kq4afreRLGLjuhyn/Gm/cHlE/Di2RfprmWQyEgBEHb
         kveCd5pCP7BqaWSUZB9o8oCYgyuyQwGDcJnNYluB1p7HEW7cBXY+2z/oNgmU/vPqPZmB
         XfNV18tW1kYMNF7Zsw1tG4sNPT/Tin1V1PIl5DgtXUgE/aiKZt/+EcO5tAQEcVPj7PAj
         oY5g5ZWOf79aKwRh5LOPSiWJ322+eNofM+Iwhztcn9A6upMSi1lsEtfRhJonBCiIxbsc
         R1KQ==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 2/2] FAQ-BUILD: Add a description for the automated latex package install script
Date: Sat, 27 Mar 2021 12:21:24 +0100
Message-Id: <20210327112124.29206-2-sj38.park@gmail.com>
In-Reply-To: <20210327112124.29206-1-sj38.park@gmail.com>
References: <20210327112124.29206-1-sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This commit adds a description for the automated latex package install
script, 'utilities/install_latex_package.sh'.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 FAQ-BUILD.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index 0d3330b3..c0afc430 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -210,6 +210,12 @@
 	    2.	Install it by following instructions at:
 		https://help.ubuntu.com/community/LaTeX#Installing_packages_manually
 
+	B.	Instead of above manual steps, you could install the package
+		using a script in this repository,
+		'./utilities/install_latex_package.sh'.  For example:
+
+			$ ./utilities/install_latex_package.sh epigraph
+
 11.	Is it possible to generate SyncTeX database file?
 
 	A.	Yes, it is. Setting an environment variable:
-- 
2.17.1

