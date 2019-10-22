Return-Path: <SRS0=bx9V=YP=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5fu9feH9hmSrtGEDJj74gyDa7RCl/vxyjBJfCbNOA+Y=;
        b=IC0UB0OS3XgLtSAoEwQUlO2iL9wnyxrDcGAPTPYNA7voCK7P+kv9HIJQSDXdifSvrY
         WHfVMSYbiuY8xFVLDRwhvWKlXh3LqwJI6ZmusBcpq+l4XzGcyqDyW/y0oCOc7iYtwiR3
         qkZynneO0f92mOkKGZQCOYmia5FK7Cln/ZgqCwiD2J7cf9lDnUgzwu9j1UaESxYvv9+v
         SOrdocB6C6k+YEqoqGAMQ/TwbaNNPLWr335P+z6i+gxaDK/FbBqj+plzK3Q3oeXg5M6X
         ZOu2TA3HaxFTYH1mSwiC/ToCSkteSFRpTT4pZ5aOl6+d89jdv1Ob3n2vBip7Dm4jajkB
         5n8Q==
Subject: [PATCH v3 4/6] FAQ-BUILD: Mention how to enable SyncTeX support
References: <fac2cbbb-492c-acde-14a8-15ee04b95ea9@gmail.com>
 <2d2eb3d6-d050-6f0c-aca5-b0cc76e8e0ec@gmail.com>
 <eda1f6d1-50ef-8447-1eab-5db776eb3981@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5f548a99-cc1f-4aa3-2b43-48a4421c88f9@gmail.com>
Date: Tue, 22 Oct 2019 20:22:02 +0900
MIME-Version: 1.0
In-Reply-To: <eda1f6d1-50ef-8447-1eab-5db776eb3981@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Balbir Singh <bsingharora@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From b24d7992fef7dd5534b24465a4129071dcc5b556 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 20 Oct 2019 14:11:31 +0900
Subject: [PATCH v3 4/6] FAQ-BUILD: Mention how to enable SyncTeX support

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 FAQ-BUILD.txt                | 39 ++++++++++++++++++++++++++++++++++++
 utilities/synctex-forward.sh |  2 ++
 2 files changed, 41 insertions(+)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index b3f04e67..4cab43b0 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -159,3 +159,42 @@
 
 	    2.	Install it by following instructions at:
 		https://help.ubuntu.com/community/LaTeX#Installing_packages_manually
+
+11.	Is it possible to generate SyncTeX database file?
+
+	A.	Yes, it is. Setting an environment variable:
+
+		    $ export LATEX_OPT="-synctex=1"
+
+		and doing "make clean; make" will generate
+		perfbook.synctex.gz. This will enable SyncTeX search
+		(.pdf <-> .tex) with a SyncTeX-supporting combination of
+		pdf viewer and editor.
+
+	    Notes:
+	      -	For an introduction of SyncTeX search (gedit <-> evince), see:
+
+		    https://help.gnome.org/users/evince/stable/index.html.en#synctex
+
+		Other combinations of SyncTeX-supporting viewers and editors
+		may work.
+
+	      - You need to install gedit-plugins and enable SyncTeX plugin
+		in gedit's preference.
+
+	      - You need to open one of LaTeX sources (e.g. perfbook.tex)
+		in gedit before doing inverse search from evince.
+
+	      - The environment variable LATEX_OPT works for other build
+		targets such as perfbook-1c.pdf, perfbook-hb.pdf, etc.
+		To enable forward search from gedit, run e.g.:
+
+		    $ utilities/synctex-forward.sh 1c
+
+	      - Changes made by utilities/synctex-forward.sh can be
+		reverted by running:
+
+		    $ utilitied/synctex-forward.sh
+
+		Please make sure to revert the changes before doing
+		"git commit" of the other updates you've made.
diff --git a/utilities/synctex-forward.sh b/utilities/synctex-forward.sh
index 312f9cc3..e08d87fa 100755
--- a/utilities/synctex-forward.sh
+++ b/utilities/synctex-forward.sh
@@ -21,6 +21,7 @@
 # If LATEX_OPT does not have "synctex", do nothing
 if ! echo $LATEX_OPT | grep -q synctex ; then
 	echo "LATEX_OPT has no synctex option. Exiting..."
+	echo "See #11 in FAQ-BUILD.txt for SyncTeX support."
 	exit 1
 fi
 
@@ -86,4 +87,5 @@ fi
 mainbase="${main%.tex}"
 if [ `ls -1 perfbook* | grep -c $mainbase.synctex` -eq 0 ] ; then
 	echo "### $mainbase.synctex*: file not found."
+	echo "### See #11 in FAQ-BUILD.txt for how to generate one."
 fi
-- 
2.17.1


