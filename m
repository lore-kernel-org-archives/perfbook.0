Return-Path: <SRS0=9lAq=ZD=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=8hOCiaZspyeDvL+3DrlRb/2DtjYX/X86xrg+eMoS75c=;
        b=G2vB7WFujjXD8P2oltgzRd3FRBSs1ngrXuOwbd6LIh473Lux7N6WNu5aFYAfoRl8zb
         YZwPqhCXuvZhAB81tWWWKc7m9lXMl+S1Q7ONdlai+VOcf2wgj2uQB5XA9RSZus5Sfqr6
         xiOLPX8vUIp3O0QLNP6GNPdiud5wdvWUovCRbCM7+wjR3QT4Uh4eSZsUyum8/0V1WKZ/
         OgcCZ2IH6BI9rC//jCKSkASRBArsYWWeCR7nt33O+greYPO392y3+s5zkZBxAlBEWzxW
         LhMxHMUgKMilF01LCA/6++CFqF0A3mUTeZEUHmcXdQ8HK3zHQBhrolFnSI9FcXOoa983
         KNJQ==
Message-ID: <da2fde84-6253-73b4-4eeb-0186e52f74fc@gmail.com>
Date: Wed, 31 Aug 2022 23:41:35 +0900
MIME-Version: 1.0
Subject: Comments in the form of patch
Content-Language: en-US
References: <20220829135533.GA1839874@paulmck-ThinkPad-P17-Gen-1>
 <3e1afa78-865b-6fb4-ca69-36529f1a8e69@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <3e1afa78-865b-6fb4-ca69-36529f1a8e69@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

This is a collection of comments in the form of a patch.
I think you can figure out what I want to say, but if unclear,
please ask.

        Thanks, Akira
---
 defer/rcuusage.tex  |  2 ++
 locking/locking.tex | 12 ++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
index eba1033bbbc3..0cefe84d0e63 100644
--- a/defer/rcuusage.tex
+++ b/defer/rcuusage.tex
@@ -1732,11 +1732,13 @@ locking and by static data-structure layout, respectively.
 
 	Hazard pointers can be considerd to combine temporal and spatial
 	synchronization in a similar manner.
+% reference to \cref{lst:defer:Hazard-Pointer Recording and Clearing}?
 	The \co{hp_record()} function's acquisition of a reference
 	provides both spatial and temporal synchronization, subscribing
 	to a version and marking the start of a reference, respectively.
 	This function therefore combines the effects of RCU's
 	\co{rcu_read_lock()} and \co{rcu_dereference()}.
+% reference to \cref{lst:defer:Hazard-Pointer Scanning and Freeing}?
 	The \co{hp_clear()} function's release of a reference provides
 	temporal synchronization marking the end of a reference, and is
 	thus similar to RCU's \co{rcu_read_unlock()}.
diff --git a/locking/locking.tex b/locking/locking.tex
index f0b4513995a7..df6458063a89 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -1136,6 +1136,13 @@ Of course, locks partition time instead of sawing wood,\footnote{
 	are described in \cref{chp:Deferred Processing}.}
 but just like sawing wood, using locks to partitioning wastes some of
 that time due to lock overhead and (worse yet) lock contention.
+%%% ^^^ I could not parse this sentence for the first time.
+% ..., [using locks] to [partitioning wastes] [some of that time] ???
+%
+% [partitioning wastes] looked like a noun phrase.
+%
+% ..., partitioning time with locks wastes some of that time ... ???
+%%%
 One important difference is that if someone saws a board into too-small
 pieces, the resuting conversion of most of that board into sawdust will
 be immediately obvious.
@@ -1178,6 +1185,11 @@ be accessed by the lock holder without interference from other threads.
 The Rust programming language takes lock/data association a step further
 by allowing the developer to make a compiler-visible association between
 a lock and the data that it protects.
+% A \cite{} or two for the Rust lang?
+%   - https://www.rust-lang.org/
+%   - https://doc.rust-lang.org/book/ch16-00-concurrency.html
+%
+% Brief introduction of the Rust lang somewhere in Chapter 2?
 When such an association has been made, attempts to access the data
 without the benefit of the corresponding lock will result in a
 compile-time diagnostic.
-- 
2.25.1


