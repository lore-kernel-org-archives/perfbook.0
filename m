Return-Path: <SRS0=7eUo=ZY=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Pk49MAtp82zg6x5WATKMK+PuQ1njB7DKo0l59L50kXs=;
        b=N8Dzdfu6Ox8toC0QzDhuHbfp4C3jb0r3h0ypDHl9qPKZbzvBwSvJZaHnbd6jr/zqLV
         U2cOHRi9AL3RvLyCqkRlEMRqF9wQgjBC+TBTy9vf9sv1oQMi1TMiwO/sE8tikD7vR8qD
         J13bRUXhy2cscw3fi0hlS3kYgw0VxEX07tL9Vnfww6UIWbya4vsSaP16p+YeQQj8ucMV
         M6tWlFGAjXcS3L7lcY8XwTkrWkDXbtjYyAbR0t5hoy3mftNypVPOsMsN7bgJT+4EM9cy
         hfo06s9+d8dTK+tGjZtnSyMFjE1U8xMleD05J7oCk5JjmNqqg+pN3GIb9+d6TTSijZql
         TWtg==
Subject: [PATCH 2/6] FAQ-BUILD: Add a workaround for Fedora's Ghostscript
 regression
References: <bd2bcae7-bfde-241f-281c-832615d1c9c0@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <484e95aa-c806-6c32-b404-8400c89d59b6@gmail.com>
Date: Tue, 3 Dec 2019 00:16:58 +0900
MIME-Version: 1.0
In-Reply-To: <bd2bcae7-bfde-241f-281c-832615d1c9c0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From d32b51f730834673c78d33beb2705fbc10ae3bcf Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 30 Nov 2019 19:15:41 +0900
Subject: [PATCH 2/6] FAQ-BUILD: Add a workaround for Fedora's Ghostscript regression

Now that Fedora 31 has restored gedit-plugin-synctex, remove
the note on the issue along the way.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 FAQ-BUILD.txt | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index c9683f03..4fb85e7a 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -232,16 +232,6 @@
 		Please make sure to revert the changes before doing
 		"git commit" of the other updates you've made.
 
-	    Note on Fedora 31:
-		Fedora 31 picked up a version of gedit-plugins which
-		doesn't contain the synctex plugin. It was fixed soon
-		after in the upstream gnome repository.  See:
-
-		    https://gitlab.gnome.org/GNOME/gedit-plugins/issues/6
-
-		Until Fedora 31 catches up, you might want to install
-		the plugin manually.
-
 12.	Figures of gnuplot in perfbook I built have their upper end
 	trimmed.  What am I missing?
 
@@ -253,3 +243,9 @@
 		    https://bugs.ghostscript.com/show_bug.cgi?id=700988
 
 		Let's hope Fedora will catch up soon.
+
+		Installing upstream Ghostscript 9.50 (or later) should
+		work with you, but see #7 above to get a compatible a2ping.
+
+		"make neatfreak; make" will rebuild all the figures.
+		The "-jN" option should accelerate the rebuild.
-- 
2.17.1


