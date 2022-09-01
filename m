Return-Path: <SRS0=EhcA=ZE=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=ibi4wezoVyytM5KDKJvuOWA3PQsWUrj5BuRYvTTSlmA=;
        b=lvSqUrimKFIy4sHXdOsZ5r06MThrVwAWuSVfI0PvdGGtJpR6rWcP5v96+jn257yhRz
         5fdk9suRQII4gWyPC9DwGabDtpK5dACa6wKRHWwxgTJdZSGMTP7SmRLeBcFBBKJLMn4X
         cbDHpgmbwBHmOcpexYKg64YxkL0fr2kBcYQkbC7Cfkc7JOgdZv+6N6qV0/B+qgrtSz0o
         AkLAVLgQ0QSA2NPhAdOk18G8CWsz0vDprysdut91XXcg8uilYfZn4LsHAJpcUY6FZCdO
         s9ultwXMoyemLIkOL+aWv1mhvT7+P1uqXoqoovxik7/1uzS46eqxyZno5ER/EHE/L48O
         2s7w==
Message-ID: <1d8f63ca-1c10-5b35-6634-3c2351af1943@gmail.com>
Date: Thu, 1 Sep 2022 22:47:22 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 2/2] Fix punctuation around footnotes
Content-Language: en-US
References: <1d99f4ec-b5a5-52ad-df97-cddaee9f98a5@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <1d99f4ec-b5a5-52ad-df97-cddaee9f98a5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Perfbook's convention is to put footnotes after punctuation marks.
There are a couple of footnotes placed in front of commas.

Fix them.

While here, fill in a missing comma in front of a footnote in datastruct
so that the phrase "even with today's large-memory systems" reads as such.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
I'm thinking of adding rules to catch this sort of inconsistencies in
punctcheck.pl.
The one in datastuct would be hard for such a dumb script, though.

        Thanks, Akira
--
 datastruct/datastruct.tex     | 2 +-
 intro/intro.tex               | 4 ++--
 toolsoftrade/toolsoftrade.tex | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index 714795f7c5ed..2b802e0518a5 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -2132,7 +2132,7 @@ the one hand, and performance and simplicity on the other.
 Fortunately, the relatively large memories available on modern
 systems have allowed us to prioritize performance and simplicity
 over memory overhead.
-However, even with today's large-memory systems\footnote{
+However, even with today's large-memory systems,\footnote{
 	Smartphones with gigabytes of memory, anyone?}
 it is sometimes necessary to take extreme measures to reduce
 memory overhead.
diff --git a/intro/intro.tex b/intro/intro.tex
index e39ea652ba0a..2c7ad97b8111 100644
--- a/intro/intro.tex
+++ b/intro/intro.tex
@@ -353,7 +353,7 @@ This change in focus is due to the fact that, although \IXr{Moore's Law}
 continues to deliver increases in transistor density, it has ceased to
 provide the traditional single-threaded performance increases.
 This can be seen in
-\cref{fig:intro:Clock-Frequency Trend for Intel CPUs}\footnote{
+\cref{fig:intro:Clock-Frequency Trend for Intel CPUs},\footnote{
 	This plot shows clock frequencies for newer CPUs theoretically
 	capable of retiring one or more instructions per clock, and MIPS
 	(millions of instructions per second, usually from the old
@@ -366,7 +366,7 @@ This can be seen in
 	Furthermore, the benchmarks commonly used on the older CPUs
 	are obsolete, and it is difficult to run the newer benchmarks
 	on systems containing the old CPUs, in part because it is hard
-	to find working instances of the old CPUs.},
+	to find working instances of the old CPUs.}
 which shows that writing single-threaded code and simply waiting
 a year or two for the CPUs to catch up may no longer be an option.
 Given the recent trends on the part of all major manufacturers towards
diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index dc24571a1163..97f8f2d3ecf9 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -2488,8 +2488,8 @@ per-CPU operations.
 shows this book's per-thread-variable API, which is patterned
 after the Linux kernel's per-CPU-variable API\@.
 This API provides the per-thread equivalent of global variables.
-Although this API is, strictly speaking, not necessary\footnote{
-	You could instead use \apig{__thread} or \apic{_Thread_local}.},
+Although this API is, strictly speaking, not necessary,\footnote{
+	You could instead use \apig{__thread} or \apic{_Thread_local}.}
 it can provide a good userspace analogy to Linux kernel code.
 
 \begin{listing}
-- 
2.25.1


