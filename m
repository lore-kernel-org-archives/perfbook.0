Return-Path: <bp@alien8.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
 t=1418411619; bh=5BOoV4asPh/tHq5LNWXNL5wRrh7tWfokwheaLo3ShxI=;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
 Content-Type:In-Reply-To; b=loHKIl5xr7o0RrQwlw4JwvJMrYptEZnt8AqqLj
 UvubLdrfM2MuyJKsXcsmg82mzN9cGi1jVUqHigLMrx7o9xxp92bY6k9VQmVknjxtf8J
 Zo4xoRJk6FDNQ7pKfIHfYZnXELzpNeO9B1kyf6DZs5wx18D/A14BSCxKRqlkNqz8mM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
 t=1418411619; bh=5BOoV4asPh/tHq5LNWXNL5wRrh7tWfokwheaLo3ShxI=;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
 Content-Type:In-Reply-To; b=loHKIl5xr7o0RrQwlw4JwvJMrYptEZnt8AqqLj
 UvubLdrfM2MuyJKsXcsmg82mzN9cGi1jVUqHigLMrx7o9xxp92bY6k9VQmVknjxtf8J
 Zo4xoRJk6FDNQ7pKfIHfYZnXELzpNeO9B1kyf6DZs5wx18D/A14BSCxKRqlkNqz8mM=
Date: Fri, 12 Dec 2014 20:13:37 +0100
From: Borislav Petkov <bp@alien8.de>
Subject: Re: perfbook build error
Message-ID: <20141212191337.GF30699@pd.tnic>
References: <20141211193230.GM25340@linux.vnet.ibm.com>
 <20141211195922.GH31140@pd.tnic> <20141211201014.GN25340@linux.vnet.ibm.com>
 <20141211202238.GI31140@pd.tnic> <20141211211429.GA23711@linux.vnet.ibm.com>
 <20141212163835.GA29275@linux.vnet.ibm.com> <20141212175313.GD30699@pd.tnic>
 <20141212181804.GX25340@linux.vnet.ibm.com> <20141212184737.GE30699@pd.tnic>
 <20141212185857.GZ25340@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20141212185857.GZ25340@linux.vnet.ibm.com>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Fri, Dec 12, 2014 at 10:58:57AM -0800, Paul E. McKenney wrote:
> You put this above definition in perfbook.tex?

Nope, this goes into

/usr/share/texlive/texmf-dist/tex/latex/listings/listings.sty

which is part of texlive-latex-recommended. It needs to be fixed in the
distro.

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--

