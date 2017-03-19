Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=C7mHARz5+Ezh0urfG4n5op3QaHMUZ3RBWNpmMBCm7F0=;
 b=dN9VHzsf4lz5UDei/eUZ31akNVu89q9F6Q8Sx7ZvKjci8uT/UWKSH6gmIj1iS4wj+8
 ikvk6dMxWjxbiBAgkxZYZ1Lt7WTO6IxTn29iaDQeUx6xldeykESZJamJTi882fMkSZiG
 lUl+D+LfUNYRxh/HIlEx3Fv5IhxKeB8r3KfzH2zxd8bomCapEElqa5kCb4mrRU43fsCD
 dlGOm41JlMCuaKRR5HOkFP6kKwYaOxe//lqvX0Q7D1k9DHS++jhswp+bKLejpVO5KRTf
 rqI8kunZ7Plty1IKVQdtAjd3unhWDzCGAf5H5JTigM3eGHM9dfCJGrEymRrHILscI00P
 fECQ==
Subject: [PATCH 1/6] whymb: Convert to 'description' (part 1)
References: <ad161e9f-b7f1-9e60-bed1-bad4a226e418@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <11c054d9-729f-33fe-0fa3-9eb2108c49a2@gmail.com>
Date: Mon, 20 Mar 2017 00:46:04 +0900
MIME-Version: 1.0
In-Reply-To: <ad161e9f-b7f1-9e60-bed1-bad4a226e418@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 20275a2adb3c0fcebe7d2a3ac525862c61fe725b Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 19 Mar 2017 23:21:05 +0900
Subject: [PATCH 1/6] whymb: Convert to 'description' (part 1)

These "itemize" lists look better in "decription" lists with
"nextline" style.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/whymb/whymemorybarriers.tex | 44 ++++++++++++++++++------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index 6e96af4..bd87ee7 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -289,11 +289,11 @@ that coordinate the movement of cache lines through the system.
 Many of the transitions described in the previous section require
 communication among the CPUs.
 If the CPUs are on a single shared bus, the following messages suffice:
-\begin{itemize}
-\item	Read:
+\begin{description}[style=nextline]
+\item	[Read:]
 	The ``read'' message contains the physical address of the cache line
 	to be read.
-\item	Read Response:
+\item	[Read Response:]
 	The ``read response'' message contains the data requested by an
 	earlier ``read'' message.
 	This ``read response'' message might be supplied either by
@@ -301,16 +301,16 @@ If the CPUs are on a single shared bus, the following messages suffice:
 	For example, if one of the caches has the desired data in
 	``modified'' state, that cache must supply the ``read response''
 	message.
-\item	Invalidate:
+\item	[Invalidate:]
 	The ``invalidate'' message contains the physical address of the
 	cache line to be invalidated.
 	All other caches must remove the corresponding data from their
 	caches and respond.
-\item	Invalidate Acknowledge:
+\item	[Invalidate Acknowledge:]
 	A CPU receiving an ``invalidate'' message must respond with an
 	``invalidate acknowledge'' message after removing the specified
 	data from its cache.
-\item	Read Invalidate:
+\item	[Read Invalidate:]
 	The ``read invalidate'' message contains the physical address
 	of the cache line to be read, while at the same time directing
 	other caches to remove the data.
@@ -318,13 +318,13 @@ If the CPUs are on a single shared bus, the following messages suffice:
 	as indicated by its name.
 	A ``read invalidate'' message requires both a ``read response''
 	and a set of ``invalidate acknowledge'' messages in reply.
-\item	Writeback:
+\item	[Writeback:]
 	The ``writeback'' message contains both the address and the
 	data to be written back to memory (and perhaps ``snooped''
 	into other CPUs' caches along the way).
 	This message permits caches to eject lines in the ``modified''
 	state as needed to make room for other data.
-\end{itemize}
+\end{description}

 \QuickQuiz{}
 	Where does a writeback message originate from and where does
@@ -428,51 +428,51 @@ shown in Figure~\ref{fig:app:whymb:MESI Cache-Coherency State Diagram}.
 \end{figure}

 The transition arcs in this figure are as follows:
-\begin{itemize}
-\item	Transition (a):
+\begin{description}[style=nextline]
+\item	[Transition (a):]
 	A cache line is written back to memory, but the CPU retains
 	it in its cache and further retains the right to modify it.
 	This transition requires a ``writeback'' message.
-\item	Transition (b):
+\item	[Transition (b):]
 	The CPU writes to the cache line that it already had exclusive
 	access to.
 	This transition does not require any messages to be sent or
 	received.
-\item	Transition (c):
+\item	[Transition (c):]
 	The CPU receives a ``read invalidate'' message for a cache line
 	that it has modified.
 	The CPU must invalidate its local copy, then respond with both a
 	``read response'' and an ``invalidate acknowledge'' message,
 	both sending the data to the requesting CPU and indicating
 	that it no longer has a local copy.
-\item	Transition (d):
+\item	[Transition (d):]
 	The CPU does an atomic read-modify-write operation on a data item
 	that was not present in its cache.
 	It transmits a ``read invalidate'', receiving the data via
 	a ``read response''.
 	The CPU can complete the transition once it has also received a
 	full set of ``invalidate acknowledge'' responses.
-\item	Transition (e):
+\item	[Transition (e):]
 	The CPU does an atomic read-modify-write operation on a data item
 	that was previously read-only in its cache.
 	It must transmit ``invalidate'' messages, and must wait for a
 	full set of ``invalidate acknowledge'' responses before completing
 	the transition.
-\item	Transition (f):
+\item	[Transition (f):]
 	Some other CPU reads the cache line, and it is supplied from
 	this CPU's cache, which retains a read-only copy, possibly also
 	writing it back to memory.
 	This transition is initiated by the reception of a ``read''
 	message, and this CPU responds with a ``read response'' message
 	containing the requested data.
-\item	Transition (g):
+\item	[Transition (g):]
 	Some other CPU reads a data item in this cache line,
 	and it is supplied either from this CPU's cache or from memory.
 	In either case, this CPU retains a read-only copy.
 	This transition is initiated by the reception of a ``read''
 	message, and this CPU responds with a ``read response'' message
 	containing the requested data.
-\item	Transition (h):
+\item	[Transition (h):]
 	This CPU realizes that it will soon need to write to some data
 	item in this cache line, and thus transmits an ``invalidate'' message.
 	The CPU cannot complete the transition until it receives a full
@@ -481,14 +481,14 @@ The transition arcs in this figure are as follows:
 	their caches via ``writeback'' messages (presumably to make room
 	for other cache lines),
 	so that this CPU is the last CPU caching it.
-\item	Transition (i):
+\item	[Transition (i):]
 	Some other CPU does an atomic read-modify-write operation on
 	a data item in a cache line held only in this CPU's cache,
 	so this CPU invalidates it from its cache.
 	This transition is initiated by the reception of a ``read invalidate''
 	message, and this CPU responds with both a ``read response''
 	and an ``invalidate acknowledge'' message.
-\item	Transition (j):
+\item	[Transition (j):]
 	This CPU does a store to a data item in a cache line that was not
 	in its cache, and thus transmits a ``read invalidate'' message.
 	The CPU cannot complete the transition until it receives the
@@ -496,12 +496,12 @@ The transition arcs in this figure are as follows:
 	messages.
 	The cache line will presumably transition to ``modified'' state via
 	transition (b) as soon as the actual store completes.
-\item	Transition (k):
+\item	[Transition (k):]
 	This CPU loads a data item in a cache line that was not
 	in its cache.
 	The CPU transmits a ``read'' message, and completes the
 	transition upon receiving the corresponding ``read response''.
-\item	Transition (l):
+\item	[Transition (l):]
 	Some other CPU does a store to
 	a data item in this cache line, but holds this cache line in read-only
 	state due to its being held in other CPUs' caches (such as the
@@ -509,7 +509,7 @@ The transition arcs in this figure are as follows:
 	This transition is initiated by the reception of an ``invalidate''
 	message, and this CPU responds with
 	an ``invalidate acknowledge'' message.
-\end{itemize}
+\end{description}

 \QuickQuiz{}
 	How does the hardware handle the delayed transitions
-- 
2.7.4


