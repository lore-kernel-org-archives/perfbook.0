Return-Path: <SRS0=UQw6=IW=gmail.com=bsingharora@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2G+xzmaCF+lUgvoMhXXQWV7u3MWtk05q9iwWEj8O4vc=;
        b=cc3YCNHxnPXyLE6M8aoMtz/7NSvscd0V8BRQcfE/+0W337ovv5drFLk1XFb3jci58+
         37t+QIqgW1xTwbRTa8y/x1FqSSLgk1jbU/CrHzCYA/Bo5hrxrJz8N5bScacF1ivF86sw
         TR/KW0j37zzONJg1NxaUMB1gXHzO4vL6zKqDpu330p1QAb+NW3eQ09lGvq5lojrhHHUM
         pPjDPFiLn1YxhmSKC01s2IhDdFmS+S/rbxyOW6ySPiD7NEBer4pSGwBDIG7MIufKtfg3
         ZMAn73hn/QuPn6lzmsOIO/jc6ocBvuuWSu3LxuZ72RNhjJ8toHD+z96iqESecuuYkbdE
         0OqA==
Date: Wed, 24 Mar 2021 12:15:29 +1100
From: Balbir Singh <bsingharora@gmail.com>
Subject: Re: [RFC PATCH] perfbook/papersize: ebook reader size support
Message-ID: <20210324011529.GK77072@balbir-desktop>
References: <20210323010153.GH77072@balbir-desktop>
 <20210323052354.GS2696@paulmck-ThinkPad-P72>
 <20210323093822.GJ77072@balbir-desktop>
 <3a81ce2e-3c94-9609-b6a3-e4597425e838@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a81ce2e-3c94-9609-b6a3-e4597425e838@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Tue, Mar 23, 2021 at 10:39:50PM +0900, Akira Yokosawa wrote:
> Hi Balbir,
> 
> I am surprised to see perfbook's LaTeX codebase works fairly well
> in the ebook paper size.
>

It does and it makes it easier on the eyes. My suggestion is to
try the patch and then see for yourself, it'll help with the
improvements you suggest below
 
> Impressive, indeed!
> 

Yep, the magic is done by LaTeX :)

> A few inline comments:
> 
> On Tue, 23 Mar 2021 20:38:22 +1100, Balbir Singh wrote:
> > On Mon, Mar 22, 2021 at 10:23:54PM -0700, Paul E. McKenney wrote:
> >> On Tue, Mar 23, 2021 at 12:01:53PM +1100, Balbir Singh wrote:
> > ...
> >> Very good!
> >>
> >> But would it be possible to create a separate build target for this
> >> combination?  Just in case others are using 1c for normal-sized paper?
> >>
> > 
> > Add support for ebooksize, which is roughly the size of
> > a kindle (4.5in, 6.3in) with margin size of 0.2in. The
> > recommended changes were taken from stackexchange with
> > links in the code. Not all tables take nicely to the
> > new size and warnings are produced, these warnings are about
> > about overfull hbox's. This size/target also enforces
> > single column output and increases the size of the pdf
> > by almost 40% in terms of number of pages. The actual size
> > on the disk is not all that different. The final output
> > though is very readable on the kindle I own.
> > 
> > I've been running the command via
> > 
> > env PERFBOOK_PAPER=ER make perfbook-er.pdf
> 
> Do you still need to set PERFBOOK_PAPER? 
> 

I use it to set PERFBOOK_BASE

> > 
> > TODOs:
> > 1. Make tables and some figures work nicely in this mode
> 
> Shrinking tables and figures is not so hard, but to shrink tall
> code snippets might be tricky.
>

The code snippets turned out just fine, the tables had overflows.
Even the images are largely fine.
 
> I have some ideas to do them.  Can you wait a couple of days?
> I'll post some PoC scheme for you to base your further tuning.
> 
> Just shrinking tables and code snippets might result in
> illegibly small font, though.
>

The code is fine so far, I think with the tables, we might need
to find a way for allowing them to cross page boundaries, I have
not looked at the table macros yet.

My suggestion is for you to try the patch, see the rendered PDF
output and look for artifacts like table 9.1
 
> > 2. Consider scaling the font
> 
> You mean the font size of 10pt is too large for ebook readers?
>

I meant largely for tables, the font size on my kindle seems nice.
 
>         Thanks, Akira
> 

Thanks,
Balbir Singh.
