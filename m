Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=FXXSL91ArtIzB1lZGJzkQf3bMfVHRwdZUgvXl7dtRog=;
 b=hTi88tuedCbZ0hz77ytlpzX7T/BYAOmx9ZKxzjFV39ihF2dUXD85obDkKvBFQ0azB9
 O67jGIeBfn8LbEtBWrRbMrzX1N/aNGXLkb9l5c3ICifARsf8YqhznNkPeNTiy3T8CK4R
 EJuIYLLj0ij3WPHQp9Fpr9LlUfc8XrdBLf+2zD5bNDTd7jrms/kWPAaG/THa3tyGLsVD
 XsZIS6jZ9uC3f1vPeg1E21LZX1Gy0Ao7Slhn2GZkdHdiJIf+J6i94dl/gGPi2PrbSozM
 RClIGuix0sgZn2EIyDGDYExRdD7WIomxeg80UpP/6NOkOTFINMZ7eVF3IG7tY1kyYEwp
 Tzwg==
Subject: [PATCH 4/8] Add hyphenation exceptions file for perfbook
References: <2c5427c4-463a-d118-3c30-d2c9f7ffd5a7@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <4ca85a96-3c2d-98e1-09ed-79c24ff29820@gmail.com>
Date: Tue, 17 Jan 2017 00:01:46 +0900
MIME-Version: 1.0
In-Reply-To: <2c5427c4-463a-d118-3c30-d2c9f7ffd5a7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 180504e47619634305eb71469d1e8c12e1736503 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 15 Jan 2017 16:50:18 +0900
Subject: [PATCH 4/8] Add hyphenation exceptions file for perfbook

To prevent 6 letter abbreviations "REQACK" and "COPART" from
being hyphenated, list them in \hyphenation{} command.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 pfhyphex.tex | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 pfhyphex.tex

diff --git a/pfhyphex.tex b/pfhyphex.tex
new file mode 100644
index 0000000..768de86
--- /dev/null
+++ b/pfhyphex.tex
@@ -0,0 +1,4 @@
+\hyphenation{
+  REQACK
+  COPART
+}
-- 
2.7.4


