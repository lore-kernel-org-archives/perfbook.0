Return-Path: <bp@alien8.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
 t=1418327964; bh=+9U7qRqiqlBgjSjnHFQ970X7tFgz56G7A/NVVs6TnF8=;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
 Content-Type:In-Reply-To; b=nSI1daLBeXor94DNgS1nczygMjcrwiREhfJWxT
 2JMOoxoXnMccGgQBV/zgt+AnLbOF1zsD7SqoEGzrBoRatjal7aTtJJBqQ0pKcgCjWhO
 sGYp1A+K+SEQr/50KOWIfrAKD1GWetXL9VrgEE8yBoyBtE0X5whW4u0MoiNaVThfcY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
 t=1418327964; bh=+9U7qRqiqlBgjSjnHFQ970X7tFgz56G7A/NVVs6TnF8=;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
 Content-Type:In-Reply-To; b=nSI1daLBeXor94DNgS1nczygMjcrwiREhfJWxT
 2JMOoxoXnMccGgQBV/zgt+AnLbOF1zsD7SqoEGzrBoRatjal7aTtJJBqQ0pKcgCjWhO
 sGYp1A+K+SEQr/50KOWIfrAKD1GWetXL9VrgEE8yBoyBtE0X5whW4u0MoiNaVThfcY=
Date: Thu, 11 Dec 2014 20:59:22 +0100
From: Borislav Petkov <bp@alien8.de>
Subject: Re: perfbook build error
Message-ID: <20141211195922.GH31140@pd.tnic>
References: <20141211173210.GE31140@pd.tnic>
 <20141211175248.GK25340@linux.vnet.ibm.com> <20141211190724.GF31140@pd.tnic>
 <20141211191734.GG31140@pd.tnic> <20141211193230.GM25340@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20141211193230.GM25340@linux.vnet.ibm.com>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Thu, Dec 11, 2014 at 11:32:30AM -0800, Paul E. McKenney wrote:
> Or the newer version of latex doesn't like the \co{} macro definition.
> 
> One hack-around is to replace the definition on line 38 of perfbook.tex
> with something like this:
> 
> 	\newcommand{\co}[1]{\url{#1}}
> 
> Does that help, modulo the resulting bogus links?

Nah, this chokes on the '#' char:

! Illegal parameter number in definition of \Hy@tempa.
<to be read again> 
                   d
l.876 two \co{#define}
                       statements, giving us not one but two ways to create
? 
! Emergency stop.
<to be read again> 
                   d
l.876 two \co{#define}
                       statements, giving us not one but two ways to create
End of file on the terminal!
---

Btw, don't waste too much time with it before you can reproduce it
yourself and can actually confirm it is a latex issue. I might be
missing packages or so... although updating texlive-latex-* works out
fine and pulls in whatever it needs.

Btw, it looks like it has trouble with this custom defined command. Built-in
stuff works:

---
diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index c98f3a78652f..e227fe7363fb 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -1242,7 +1242,7 @@ but may be implemented straightforwardly as follows:
        \hline
        \hline
        Thread Management
-               & \co{pthread_t}
+               & \L test
                        & \co{struct task_struct} \\
        \cline{2-3}
                & \co{pthread_create()}
--

I need to investigate more.

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--

