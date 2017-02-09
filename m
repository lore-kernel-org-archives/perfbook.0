Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:40801 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1752643AbdBIVbk (ORCPT <rfc822;perfbook@vger.kernel.org>); Thu, 9
 Feb 2017 16:31:40 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v19Jim3f120370
 for <perfbook@vger.kernel.org>; Thu, 9 Feb 2017 14:45:53 -0500
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 28gcn8pcdh-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Thu,
 09 Feb 2017 14:45:53 -0500
Received: from localhost by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Thu, 9 Feb 2017
 12:45:52 -0700
Date: Thu, 9 Feb 2017 11:45:49 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH v2] alphapf.bst: Make use of 'location' field in
 'inproceedings' entry
Reply-To: paulmck@linux.vnet.ibm.com
References: <054a2a2b-1391-7047-5dcf-b3eb355facb3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <054a2a2b-1391-7047-5dcf-b3eb355facb3@gmail.com>
Message-Id: <20170209194549.GI30506@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Feb 09, 2017 at 10:36:53PM +0900, Akira Yokosawa wrote:
> >From a7c875d0ef8a995a3c119caeb11e576094f89865 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sun, 29 Jan 2017 00:57:29 +0900
> Subject: [PATCH v2] alphapf.bst: Make use of 'location' field in 'inproceedings' entry
> 
> In early "inproceedings" entries, "address" fields are used to
> indicate the location of conferences as is described in BibTeX
> documentation[1].
> 
> However, in recent entries such as those copied from e.g. ACM
> BibTeX templates, "address" fields are used for publisher's
> addresses. In such entries, "location" fields are used instead
> to show where those events were held.
> 
> The circumstances of how to handle locations of conferences in
> bibliography databases are far from being settled within LaTeX
> community[2][3].
> 
> This commit therefore adds awareness of "location" field in
> alphapf.bst for "inproceedings" entry, and lets the field have
> a higher precedence than an "address" field if both fields are
> present. It has no effect on other types of entries or 
> "inproceedings" entries with "address" field only.
> 
> This change can be thought of as a compromise to improve the
> consistency presented in Bibliography in a non-intrusive way.
> 
> This commit also adds comment in the header describing changes made
> for perfbook.
> 
>   [1] Excerpt of BibTeX documentation (shown by "texinfo bibtex"):
> 
>     10. The PROCEEDINGS and INPROCEEDINGS entry types now use the
>         address field to tell where a conference was held, rather
>         than to give the address of the publisher or organization.
>         If you want to include the publisher's or organization's
>         address, put it in the publisher or organization field.
> 
>   [2] "How to show the location of a conference in BibTeX":
>       http://tex.stackexchange.com/questions/76566/
> 
>   [3] "Abuse of address field in BibTeX entries":
>       http://tex.stackexchange.com/questions/152725/
> 
> Note: It is easier to see the diff with white-space changes ignored.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Applied and pushed, thank you!

							Thanx, Paul

> ---
> Hi Paul,
> 
> I rewrote the log message to reflect the questions and answers regarding
> the first attempt. I hope you would find this one easier to apply than v1.
> I also replaced hard tabs slipped in v1 with spaces.
> 
>                                               Thanks, Akira
> 
>  alphapf.bst | 47 +++++++++++++++++++++++++++++++++--------------
>  1 file changed, 33 insertions(+), 14 deletions(-)
> 
> diff --git a/alphapf.bst b/alphapf.bst
> index 6a9ec4d..47b28ea 100644
> --- a/alphapf.bst
> +++ b/alphapf.bst
> @@ -6,6 +6,15 @@
>  %%% Added DOI support.
>  %%% Added PUBMED support.
>  %%% Added hyperref support.
> +%%%
> +%%% Also modified by Akira Yokosawa <akiyks@gmail.com> for perfbook.
> +%%% (marked with "% ay")
> +%%% Brought date field of unpublished entry in front of note field.
> +%%% (In perfbook, note field is mostly used for URL info.)
> +%%% Added support of location field in inproceedings entry.
> +%%% If "location" is available, it is used instead of "address".
> +%%% Copyright (C) 2016, 2017 Akira Yokosawa.
> +%%%
>  %%% Original headers follow...
> 
>  % BibTeX standard bibliography style `alpha'
> @@ -46,6 +55,7 @@ ENTRY
>      pubmed % urlbst
>      url % urlbst
>      lastchecked % urlbst
> +    location %ay
>    }
>    {}
>    { label extra.label sort.label }
> @@ -1022,19 +1032,28 @@ FUNCTION {inproceedings}
>        format.bvolume output
>        format.number.series output
>        format.pages output
> -      address empty$
> -        { organization publisher new.sentence.checkb
> -          organization output
> -          publisher output
> -          format.date "year" output.check
> -        }
> -        { address output.nonnull
> -          format.date "year" output.check
> -          new.sentence
> -          organization output
> -          publisher output
> -        }
> -      if$
> +      location empty$        %ay
> +        { address empty$     %ay
> +          { organization publisher new.sentence.checkb
> +            organization output
> +            publisher output
> +            format.date "year" output.check
> +          }
> +            { address output.nonnull
> +              format.date "year" output.check
> +              new.sentence
> +              organization output
> +              publisher output
> +            }
> +          if$
> +        }                                 % ay
> +        { location output.nonnull         % ay
> +          format.date "year" output.check % ay
> +          new.sentence                    % ay
> +          organization output             % ay
> +          publisher output                % ay
> +        }                                 % ay
> +      if$                                 % ay
>      }
>      { format.incoll.inproc.crossref output.nonnull
>        format.pages output
> @@ -1187,7 +1206,7 @@ FUNCTION {unpublished}
>    new.block
>    title empty$ 'skip$ 'possibly.setup.inlinelink if$ % urlbst
>    format.title "title" output.check
> -  format.date output
> +  format.date output        % ay
>    new.block
>    note "note" output.check
>    fin.entry
> -- 
> 2.7.4
> 

