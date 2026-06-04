Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9DC33D501
	for <perfbook@vger.kernel.org>; Thu,  4 Jun 2026 10:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780568282; cv=none; b=oiOi7iVP9+Dxec+w0U62w7NBexXa31daShupjoQ0ZEMh5gnAjSZqqm/EyKitS3Zw3OX7ndthJXSjKe5SNbNdY+C4kuGmxA51+e65LuwyglpD/j23PzC2a5fOtvTkHKCBymwGFrC1WbmDxEZSSgH+zBa6ChT1fm8a1hCgQ2dHLVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780568282; c=relaxed/simple;
	bh=+ovVBtU6q++Np5CYj5GgtKHvR3TA+di5fj56x0hxQco=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u561u3EBX6fy1fwV1ptu9HIn/BgtI1d1cifKqAW84Q6CiWcwCiH0eoOky+ZM61d/C5KXfqI5UsxOMIKKWfYfOGKzEdiUZaD87Z3wVBXpasNR2ohtX7lg4/bb9IgShtt8muplSsqBrt09TSk4Dzozx9u3RALd9yP1xlft9F349N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M7vUN4Up; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M7vUN4Up"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c0c1e0d00bso5263655ad.0
        for <perfbook@vger.kernel.org>; Thu, 04 Jun 2026 03:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780568280; x=1781173080; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wj1LmjOia1rDMEvAB+MpcOXI3ctG5R1dBtMfZUUjDfE=;
        b=M7vUN4UpN04sOAghM3+smNF7PYbfyebbiGWTTBKy43V1Bs9jMz7SbIw/82Y0TupaVO
         /V31zdJ9yOMHbZDKt0tI7D+Mv9qtv/FKpuVctDamfhu++ZmeatYcF15Cff25OQEObdB1
         7GudMFnoy762iG9Eo41Pm9QlAc+zD51+GDUylBsNWZi5eEq7v5QAAqKLwQFgC/WaxJug
         rCpbIwekx1V/sgPO4ZFZlsf/6ecRYsny0iI/Pf1cE9NqQYraUvrBPQGEPSdDF417PFoM
         fIO/b9soWEAwlPMHNYc8BQLR6T9a+fALzBWrNtTbDebEi7TohYJsEen9+Z9eDs6gkPTH
         IvOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780568280; x=1781173080;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wj1LmjOia1rDMEvAB+MpcOXI3ctG5R1dBtMfZUUjDfE=;
        b=r40x4huZQqfXc/eaUxnHwHjvgsAczfKb6hZGDp3AvnOsTw1WArHJsO9iVgMy4L3EBR
         mpiLqRG8ouH7FM1bkiVCp8fUrcyqvC6Eie19yDbRa71qSIgjbC9CK3nSrGm1cfbx/PHR
         zOUP7IBee9spINU7ho6OIaZ6UAP8TpXZiMI482CUWFdgt+ygkeQ0KKUFummAhDzQC4Gr
         5mKC80V/W8Db3uUmKldpkayqaUgfl4T5Iso+/hVVlse5HdL8SmWkcBojkpSKh2GB/2e+
         GhW37ShjYI9TecqrQcOWH2DjmUhG6d9hydeFRLZiot5WRiv7loCwadHYL/h/8ApvSx2a
         xOQg==
X-Gm-Message-State: AOJu0Yz6MzcywJmSBd6aFy6KIrYJWB8e0U+c/qeJfhS5LMzgBq8UTlQY
	jn/tWhhjMj1XGlmBmKHwg+/c7x9S0EoEbHsZJNY88reDYmLLp24jTK6X
X-Gm-Gg: Acq92OGzcuY36CdGtlBdqRAIy4AwfdxINEDLSF8vy1Z2XDunmdTKE4js0WxVQVG7cSC
	GmOy4taZKjehXPcu0ovQ3+pIfTBiQc4qjlIMm+VpRGA5tICMByh/kOuUClRU7+/jpGj1hxB/7EW
	p6OeHQcCA/sIGBfa8JweKw26TLFN2rJFb+oAkajdZOLXQJIhbhmEE0GfU8rfutg/QfkW6p8N18T
	EfztjMcuQcF3ZpK4Zmob5sQrKsBcxwhTS/WV5lgPblns0t+fs9XtEAeddb35LaoS6mDMA7Pgg0J
	JFgWzmBg7v1K9iab57zVNvLVgwB9cmxyaEqs46nnQFCVAvqYmgECcsDXX8PPZO6P8DdD8PdjiS9
	mwgQyDR83g4frZkYt1citO+/zaf48bfZozyDjDIMr9wNcfQ0eEg3UQIXJjEDBFHIju/jYZuapJH
	n8TUS0nvaqmJbfHkmr9m8qa779kxxVG4qBp+y5l4XeCg61w0aBglq4vdbmVD3F3xhdpxL091DFU
	8gn5kI=
X-Received: by 2002:a17:902:ecc8:b0:2c0:d4a8:85d0 with SMTP id d9443c01a7336-2c1644a8ed4mr75391195ad.32.1780568280263;
        Thu, 04 Jun 2026 03:18:00 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664abb3csm56329945ad.81.2026.06.04.03.17.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 03:17:59 -0700 (PDT)
Message-ID: <187b11c4-cb24-43a2-9fe3-f7b4a8941427@gmail.com>
Date: Thu, 4 Jun 2026 19:17:58 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 4/6] Get rid of "arydshln"
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <238a898f-78dd-48ff-b2b8-996b477dbcf6@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <238a898f-78dd-48ff-b2b8-996b477dbcf6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Loading both "arydshln" and "tabularx" has started causing fatal
errors since the release of LaTeX2e <2026-06-01>.

arydshln wants to modify some of essential commands defined in
tabular related packages in a dangerous way, which conflicts with
recent changes in LaTeX2e and those packages.

As arydshln hasn't seen any updates since February 2019, and 
perfbook has *only* one table with dashed rules under datastruct/
(with a couple of examples in style guide ignored), getting rid
of arydshln should be the way forward.

While at it, remove most of example tables in style guide.
They are not relevant anymore as their counterparts in the main
matter have had retouches themselves.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/styleguide/styleguide.tex | 355 +----------------------------
 datastruct/datastruct.tex          |  19 +-
 perfbook-lt.tex                    |   1 -
 3 files changed, 10 insertions(+), 365 deletions(-)

diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index 2f2c9057..38a63937 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -1180,12 +1180,7 @@ used sparingly, especially in tables of simple structure.
 (corresponding to a table from a now-deleted section)
 is drawn by using the features of ``booktabs'' and ``xcolor'' packages.
 Note that ruled lines of booktabs can not be mixed with
-vertical lines in a table.\footnote{
-  There is another package named ``arydshln'' which provides dashed lines
-  to be used in tables.
-  A couple of experimental examples are presented in
-  \cref{sec:app:styleguide:Table Layout Experiment}.
-}
+vertical lines in a table.
 
 \begin{table}
 \rowcolors{1}{}{lightgray}
@@ -1397,7 +1392,7 @@ from the actual number.
 \label{sec:app:styleguide:Table Layout Experiment}
 
 This section presents some experimental tables
-using booktabs, xcolors, and arydshln packages.
+using ``booktabs'' and ``xcolors'' packages.
 The corresponding tables in the text have been converted using one of
 the format shown here.
 The source of this section can be regarded as a reference to be
@@ -1495,352 +1490,6 @@ since they are redundant there.
 \label{tab:app:styleguide:Synchronization and Reference Counting}
 \end{table}
 
-\Cref{tab:app:styleguide:Cache Coherence Example}
-(corresponding to
-\cref{tab:app:whymb:Cache Coherence Example})
-is a sequence diagram drawn as a table.
-
-\begin{table*}
-\small
-\centering
-\renewcommand*{\arraystretch}{1.2}
-\rowcolors{6}{}{lightgray}
-% "6" is chosen due to disturbance of row count by cmidrule.
-% The command definition is:
-%     \rowcolors{<row>}{<odd-row color>}{<even-row color>}
-% Here, <row> specifies the row count where the coloring start.
-% In this table, the "Seq = 0" row is the 3rd row, so a "3" would
-% be a right choice.
-% However, because of the \cmidrule{} commands used in the heading,
-% internal row count of the "Seq = 0" row becomes "6".
-% This is why the 3rd row has the background color of <even-row color>.
-%
-% \cline of plain LaTeX also interfares the row count.
-\ebresizewidth{
-\begin{tabular}{rclcccccc}
-	\toprule
-	& & & \multicolumn{4}{c}{CPU Cache} & \multicolumn{2}{c}{Memory} \\
-	\cmidrule(lr){4-7} \cmidrule(l){8-9}
-	Sequence \# & CPU \# & Operation & 0 & 1 & 2 & 3 & 0 & 8 \\
-	\cmidrule(r){1-3} \cmidrule(lr){4-7} \cmidrule(l){8-9}
-%	Seq CPU Operation	------------- CPU -------------   - Memory -
-%				   0	   1	   2	   3	    0   8
-	0   &   & Initial State	& $-$/I & $-$/I & $-$/I & $-$/I   & V & V \\
-	1   & 0 & Load 0 (cache value miss)
-				& 0/S   & $-$/I & $-$/I & $-$/I   & V & V \\
-	2   & 2 & Load 0 (cache value miss)
-				& 0/S   & $-$/I & 0/S   & $-$/I   & V & V \\
-	3.1 & 0 & Load 8 (collision, invalidation)
-				& $-$/I & $-$/I & 0/S   & $-$/I   & V & V \\
-	3.2 & 0 & Load 8 (cache value miss)
-				& 8/S   & $-$/I & 0/S   & $-$/I   & V & V \\
-	4   & 3 & Load 0 (cache value miss)
-				& 8/S   & $-$/I & 0/S   & 0/S     & V & V \\
-	5.1 & 3 & CAS 0 (cache value hit)
-				& 8/S   & $-$/I & 0/S   & 0/S     & V & V \\
-	5.2 & 3 & CAS 0 (cache permission miss)
-				& 8/S   & $-$/I & $-$/I & 0/E     & V & V \\
-	5.3 & 3 & CAS 0		& 8/S   & $-$/I & $-$/I & 0/M     & I & V \\
-	6.1 & 1 & Store 8 (cache value miss)
-				& $-$/I & 8/E   & $-$/I & 0/M     & I & V \\
-	6.2 & 1 & Store 8 	& $-$/I & 8/M   & $-$/I & 0/M     & I & I \\
-	7   & 3 & CAS 0		& $-$/I & 8/M   & $-$/I & 0/M     & I & I \\
-	8.1 & 1 & Load 0 (collision, flush)
-				& $-$/I & $-$/I & $-$/I & 0/M     & I & V \\
-	8.2 & 1 & Load 0 (cache value miss)
-				& $-$/I & 0/S   & $-$/I & 0/S     & I & V \\
-	9   & 3 & Load 0 (cache value hit)
-				& $-$/I & 0/S   & $-$/I & 0/S     & I & V \\
-	\bottomrule
-\end{tabular}
-}
-\caption{Cache Coherence Example}
-\label{tab:app:styleguide:Cache Coherence Example}
-\end{table*}
-
-\Cref{tab:app:styleguide:RCU Publish-Subscribe and Version Maintenance APIs}
-is a tweaked version of
-\cref{tab:defer:RCU Publish-Subscribe and Version Maintenance APIs}.
-Here, the ``Category'' column in the original is removed
-and the categories are indicated in rows of bold-face font
-just below the mid-rules.
-This change makes it easier for \verb|\rowcolors{}| command of
-``xcolor'' package to work properly.
-
-\Cref{tab:app:styleguide:RCU Publish-Subscribe and Version Maintenance APIs (colortbl)}
-is another version which keeps original columns and colors rows only where
-a category has multiple rows.
-This is done by combining \verb|\rowcolors{}| of ``xcolor'' and
-\verb|\cellcolor{}| commands of the ``colortbl'' package
-(\verb|\cellcolor{}| overrides \verb|\rowcolors{}|).
-
-In
-\cref{tab:defer:RCU Publish-Subscribe and Version Maintenance APIs},
-the latter layout without partial row coloring has been
-chosen for simplicity.
-
-\begin{table*}
-\rowcolors{2}{}{blue!15}
-\renewcommand*{\arraystretch}{1.1}
-\footnotesize
-\centering
-\ebresizewidth{
-\begin{tabular}{lll}
-\toprule
-	Primitives &
-		Availability &
-			Overhead \\
-\midrule
-	\multicolumn{3}{l}{\bfseries List traversal} \\
-	\tco{list_for_each_entry_rcu()} &
-		2.5.59 &
-			Simple instructions (memory barrier on Alpha) \\
-\midrule
-	\multicolumn{3}{l}{\bfseries List update} \\
-	\tco{list_add_rcu()} &
-		2.5.44 &
-			Memory barrier \\
-	\rowcolor{lightgray}\tco{list_add_tail_rcu()} &
-		2.5.44 &
-			Memory barrier \\
-	\tco{list_del_rcu()} &
-		2.5.44 &
-			Simple instructions \\
-	\rowcolor{lightgray}\tco{list_replace_rcu()} &
-		2.6.9 &
-			Memory barrier \\
-	\tco{list_splice_init_rcu()} &
-		2.6.21 &
-			Grace-period latency \\
-\midrule
-	\multicolumn{3}{l}{\bfseries Hlist traversal} \\
-	\tco{hlist_for_each_entry_rcu()} &
-		2.6.8 &
-			Simple instructions (memory barrier on Alpha) \\
-\midrule
-	\multicolumn{3}{l}{\bfseries Hlist update} \\
-	\tco{hlist_add_after_rcu()} &
-		2.6.14 &
-			Memory barrier \\
-	\rowcolor{lightgray}\tco{hlist_add_before_rcu()} &
-		2.6.14 &
-			Memory barrier \\
-	\tco{hlist_add_head_rcu()} &
-		2.5.64 &
-			Memory barrier \\
-	\rowcolor{lightgray}\tco{hlist_del_rcu()} &
-		2.5.64 &
-			Simple instructions \\
-	\tco{hlist_replace_rcu()} &
-		2.6.15 &
-			Memory barrier \\
-\midrule
-	\multicolumn{3}{l}{\bfseries Pointer traversal} \\
-	\tco{rcu_dereference()} &
-		2.6.9 &
-			Simple instructions (memory barrier on Alpha) \\
-\midrule
-	\multicolumn{3}{l}{\bfseries Pointer update} \\
-	\tco{rcu_assign_pointer()} &
-		2.6.10 &
-			Memory barrier \\
-\bottomrule
-\end{tabular}
-}
-\caption{RCU Publish-Subscribe and Version Maintenance APIs}
-\label{tab:app:styleguide:RCU Publish-Subscribe and Version Maintenance APIs}
-\end{table*}
-
-\begin{table*}
-\renewcommand*{\arraystretch}{1.2}
-\rowcolors{3}{lightgray}{}
-\footnotesize
-\centering
-\ebresizewidth{
-\begin{tabular}{lllp{1.2in}}\toprule
-Category &
-	Primitives &
-		Availability &
-			Overhead \\
-\midrule
-List traversal &
-	\tco{list_for_each_entry_rcu()} &
-		2.5.59 &
-			Simple instructions (memory barrier on Alpha) \\
-\midrule
-\cellcolor{white}List update &
-	\tco{list_add_rcu()} &
-		2.5.44 &
-			Memory barrier \\
-&
-	\tco{list_add_tail_rcu()} &
-		2.5.44 &
-			Memory barrier \\
-\cellcolor{white} &
-	\tco{list_del_rcu()} &
-		2.5.44 &
-			Simple instructions \\
-&
-	\tco{list_replace_rcu()} &
-		2.6.9 &
-			Memory barrier \\
-\cellcolor{white} &
-	\tco{list_splice_init_rcu()} &
-		2.6.21 &
-			Grace-period latency \\
-\midrule
-Hlist traversal &
-	\tco{hlist_for_each_entry_rcu()} &
-		2.6.8 &
-			Simple instructions (memory barrier on Alpha) \\
-\midrule
-\cellcolor{white}Hlist update &
-	\tco{hlist_add_after_rcu()} &
-		2.6.14 &
-			Memory barrier \\
-&
-	\tco{hlist_add_before_rcu()} &
-		2.6.14 &
-			Memory barrier \\
-\cellcolor{white} &
-	\tco{hlist_add_head_rcu()} &
-		2.5.64 &
-			Memory barrier \\
-&
-	\tco{hlist_del_rcu()} &
-		2.5.64 &
-			Simple instructions \\
-\cellcolor{white} &
-	\tco{hlist_replace_rcu()} &
-		2.6.15 &
-			Memory barrier \\
-\midrule\hiderowcolors
-Pointer traversal &
-	\tco{rcu_dereference()} &
-		2.6.9 &
-			Simple instructions (memory barrier on Alpha) \\
-\midrule
-Pointer update &
-	\tco{rcu_assign_pointer()} &
-		2.6.10 &
-			Memory barrier \\
-\bottomrule
-\end{tabular}
-}
-\caption{RCU Publish-Subscribe and Version Maintenance APIs}
-\label{tab:app:styleguide:RCU Publish-Subscribe and Version Maintenance APIs (colortbl)}
-\end{table*}
-
-\Cref{tab:app:styleguide:Memory Misordering: Store-Buffering Sequence of Events}
-(corresponding to
-\cref{tab:memorder:Memory Misordering: Store-Buffering Sequence of Events})
-is also a sequence diagram drawn as a tabular object.
-
-\begin{table*}
-\rowcolors{6}{}{lightgray}
-\renewcommand*{\arraystretch}{1.1}
-\small
-\centering\OneColumnHSpace{-0.1in}
-\ebresizewidth{
-\begin{tabular}{rllllll}
-	\toprule
-	& \multicolumn{3}{c}{CPU 0} & \multicolumn{3}{c}{CPU 1} \\
-	\cmidrule(l){2-4} \cmidrule(l){5-7}
-	& Instruction & Store Buffer & Cache &
-		Instruction & Store Buffer & Cache \\
-	\cmidrule{1-1} \cmidrule(l){2-4} \cmidrule(l){5-7}
-	1 & (Initial state) & & \tco{x1==0} &
-		(Initial state) & & \tco{x0==0} \\
-	2 & \tco{x0 = 2;} & \tco{x0==2} & \tco{x1==0} &
-		\tco{x1 = 2;} & \tco{x1==2} & \tco{x0==0} \\
-	3 & \tco{r2 = x1;} (0) & \tco{x0==2} & \tco{x1==0} &
-		\tco{r2 = x0;} (0) & \tco{x1==2} & \tco{x0==0} \\
-	4 & (Read-invalidate) & \tco{x0==2} & \tco{x0==0} &
-		(Read-invalidate) & \tco{x1==2} & \tco{x1==0} \\
-	5 & (Finish store) & & \tco{x0==2} &
-		(Finish store) & & \tco{x1==2} \\
-	\bottomrule
-\end{tabular}
-}
-\caption{Memory Misordering: Store-Buffering Sequence of Events}
-\label{tab:app:styleguide:Memory Misordering: Store-Buffering Sequence of Events}
-\end{table*}
-
-\Cref{tab:app:styleguide:Refrigeration Power Consumption (arydshln)}
-shows another version of
-\cref{tab:app:styleguide:Refrigeration Power Consumption}
-with dashed horizontal and vertical rules of the arydshln package.
-
-\setlength\dashlinedash{.5pt}
-\setlength\dashlinegap{1pt}
-
-\begin{table}
-\renewcommand*{\arraystretch}{1.2}\centering\small
-\begin{tabular}{l:r:r:r}\toprule
-Situation
-	& $T$ (K)
-		& $\CPf$ & \parbox[b]{.75in}{\raggedleft Power per watt\par waste heat (W)} \\
-\hline
-Dry Ice
-	& $195$
-		& $1.990$
-			& 0.5 \\ \hdashline
-Liquid N$_2$
-	& $77$
-		& $0.356$
-			& 2.8 \\ \hdashline
-Liquid H$_2$
-	& $20$
-		& $0.073$
-			& 13.7 \\ \hdashline
-Liquid He
-	& $4$
-		& $0.0138$
-			& 72.3 \\ \hdashline
-IBM~Q	& $0.015$
-		& $0.000051$
-			& 19,500.0 \\
-\bottomrule
-\end{tabular}
-\caption{Refrigeration Power Consumption}
-\label{tab:app:styleguide:Refrigeration Power Consumption (arydshln)}
-\end{table}
-
-In this case, the vertical dashed rules seems unnecessary.
-The one without the vertical rules is shown in
-\cref{tab:app:styleguide:Refrigeration Power Consumption (arydshln-2)}.
-
-\begin{table}
-\renewcommand*{\arraystretch}{1.2}\centering\small
-\begin{tabular}{lrrr}\toprule
-Situation
-	& $T$ (K)
-		& $\CPf$ & \parbox[b]{.75in}{\raggedleft Power per watt\par waste heat (W)} \\
-\midrule
-Dry Ice
-	& $195$
-		& $1.990$
-			& 0.5 \\ \hdashline
-Liquid N$_2$
-	& $77$
-		& $0.356$
-			& 2.8 \\ \hdashline
-Liquid H$_2$
-	& $20$
-		& $0.073$
-			& 13.7 \\ \hdashline
-Liquid He
-	& $4$
-		& $0.0138$
-			& 72.3 \\ \hdashline
-IBM~Q	& $0.015$
-		& $0.000051$
-			& 19,500.0 \\
-\bottomrule
-\end{tabular}
-\caption{Refrigeration Power Consumption}
-\label{tab:app:styleguide:Refrigeration Power Consumption (arydshln-2)}
-\end{table}
 
 \IfTblCpTop{}{
 \floatstyle{plain}
diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index 527a269d..fa483d39 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -450,32 +450,29 @@ the caches, which in turn promotes locality of reference.
 The next section therefore examines optimizations that can be carried out in
 read-mostly cases where updates are rare, but could happen at any time.
 
-\setlength\dashlinedash{1pt}
-\setlength\dashlinegap{2pt}
-
 \begin{table}
 \renewcommand*{\arraystretch}{1.2}
 \centering
-\begin{tabular}{r||c:c}
+\begin{tabular}{r||c|c}
 	& \multicolumn{2}{c}{Hyperthread} \\
 	\cline{2-3}
 	Socket & 0 &  1 \\
 	\hline
 	\hline
 	0 &    0--27 & 224--251 \\
-	\cdashline{2-3}
+	\cline{2-3}
 	1 &   28--55 & 252--279 \\
-	\cdashline{2-3}
+	\cline{2-3}
 	2 &   56--83 & 280--307 \\
-	\cdashline{2-3}
+	\cline{2-3}
 	3 &  84--111 & 308--335 \\
-	\cdashline{2-3}
+	\cline{2-3}
 	4 & 112--139 & 336--363 \\
-	\cdashline{2-3}
+	\cline{2-3}
 	5 & 140--167 & 364--391 \\
-	\cdashline{2-3}
+	\cline{2-3}
 	6 & 168--195 & 392--419 \\
-	\cdashline{2-3}
+	\cline{2-3}
 	7 & 196--223 & 420--447 \\
 \end{tabular}
 \caption{NUMA Topology of System Under Test}
diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index 4eec9b67..9957abef 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -369,7 +369,6 @@
 
 \usepackage{bm} % for bold math mode fonts --- should be after math mode font choice
 \usepackage{booktabs}
-\usepackage{arydshln}
 \definecolor{lightgray}{gray}{0.9} % for coloring alternate rows in table
 
 \fvset{fontsize=\scriptsize,obeytabs=true}
-- 
2.43.0


