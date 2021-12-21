Return-Path: <SRS0=Pd6x=RG=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=EPBDRBUoCuM5wRrIBbEas0SKFyzLgx+Hf14W3ahp/DU=;
        b=dzO9HTde6d8m3brVQNc252yxfFscNGjkq/G4WZTIic/EpbG7nweTsL6en7y6ojsS83
         AaIdM0dV8gyC8cC3EGw85c3y3wWFz4XJa22skZ4sxdoEZxKhN4ctDeEEGgRboVEX8AoD
         uCosh9nqGJ1IVH9R38mOwAOgdg8TxM6/DspRPm7XdvtNJzzhqpf/VdMmHzD4QAqHRsBV
         15kSRk/fQfldKPpkAQTZh1H1MR1uD3LF+GCkvF2esSuln2j6Dlfd47Re74tFBodlSyt5
         08Tp1b9hXdsYbRe9gQbyxMh8NwkcwkAAOUenArz9naVu0h3WcE19bc0MCJAI158GoF+p
         1mqg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 1/2] defer/rcuusage: Reflect subsection reordering
Message-ID: <cd109ef0-2469-7045-d582-32a425cfb1d1@gmail.com>
Date: Tue, 21 Dec 2021 16:11:39 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Subsection of "Type-Safe Memory" was moved upward in commit
e22df8aea3f2 ("defer/rcuusage: Move type-safe-memory section").

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

This patch and the next are last minute nitpicks for the
upcoming release.

        Thanks, Akira
--
 defer/rcuusage.tex | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
index 3fbe73be..811dd32a 100644
--- a/defer/rcuusage.tex
+++ b/defer/rcuusage.tex
@@ -588,8 +588,9 @@ element being freed and reallocated as the same type of structure
 while they are referencing it, but must prohibit a change in type.
 This guarantee, called ``type-safe memory'' in
 academic literature~\cite{Cheriton96a},
-is weaker than the existence guarantees in the
-previous section, and is therefore quite a bit harder to work with.
+is weaker than the existence guarantees discussed
+in \cref{sec:defer:Existence Guarantee},
+and is therefore quite a bit harder to work with.
 Type-safe memory algorithms in the Linux kernel make use of slab caches,
 specially marking these caches with \co{SLAB_TYPESAFE_BY_RCU}
 so that RCU is used when returning a freed-up

base-commit: a8f5948a1b8921941bf4039e278aa7929f64c322
-- 
2.17.1

