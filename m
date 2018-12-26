Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:55974 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727149AbeLZPAO (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 26 Dec 2018 10:00:14 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wBQEmxmN035572
        for <perfbook@vger.kernel.org>; Wed, 26 Dec 2018 10:00:13 -0500
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2pm7twrn24-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Wed, 26 Dec 2018 10:00:13 -0500
Received: from localhost
        by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Wed, 26 Dec 2018 15:00:11 -0000
Date: Wed, 26 Dec 2018 07:00:19 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH] gen_snippet_d.pl: Add rules to ignore editor's backup
 files
Reply-To: paulmck@linux.ibm.com
References: <0f522d14-373b-fdee-6779-eeaa04ee5fa4@gmail.com>
 <20181224235832.GW4170@linux.ibm.com>
 <20181225005315.GA20719@linux.ibm.com>
 <1e5209af-3c37-fb23-6c95-e3103b211076@gmail.com>
 <5a07540a-7bf0-e0fc-9a02-9eb2314506d6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a07540a-7bf0-e0fc-9a02-9eb2314506d6@gmail.com>
Message-Id: <20181226150018.GY4170@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Dec 26, 2018 at 11:31:03PM +0900, Akira Yokosawa wrote:
> >From 6c0e6e632bbf234de340bcf51acf2007d8e3ac8b Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Wed, 26 Dec 2018 23:11:26 +0900
> Subject: [PATCH] gen_snippet_d.pl: Add rules to ignore editor's backup files
> 
> Excerpt from Paul's report:
>     $ make
>     sh ./utilities/gen_snippet_d.sh
>     sh utilities/autodate.sh >autodate.tex
>     CodeSamples/datastruct/hash/hash_resize.c --> CodeSamples/datastruct/hash/hash_resize@data.fcv
>     [...]
>     CodeSamples/datastruct/hash/.hash_resize.c.swp --> CodeSamples/datastruct/hash/CodeSamples/datastruct/hash.fcv
>     utilities/fcvextract.pl CodeSamples/datastruct/hash/.hash_resize.c.swp hash > CodeSamples/datastruct/hash/CodeSamples/datastruct/hash.fcv
>     /bin/bash: CodeSamples/datastruct/hash/CodeSamples/datastruct/hash.fcv: No such file or directory
>     make: *** [CodeSamples/datastruct/hash/CodeSamples/datastruct/hash.fcv] Error 1
> 
> .hash_resize.c.swp is a swap file of vim, which causes an invalid
> dependency rule to be emitted.
> 
> To prevent such errors, ignore .swp files as well as emacs' backup
> files ending in "~" and "#" from the search results in
> gen_snippet_d.pl.
> 
> Reported-by: Paul E. McKenney <paulmck@linux.ibm.com>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Paul,
> 
> This should ignore .swp files in the dependency file.
> Can you test "make" while opening hash_resize.c in vim?
> 
>         Thanks, Akira
> 
> PS:
> 
> I'll comment on the update of Quick Quiz 10.13 later this week.

Works great, thank you!!!

It does not handle the case where you are concurrently editing the same
file with two different instances of "vim", but that could be considered
a feature rather than a bug.  ;-)  So no need to modify further.

Queued, will push with the QQ 10.13 update.

And have a great week, especially if this is holiday time for you!

							Thanx, Paul

> --
>  utilities/gen_snippet_d.pl | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/utilities/gen_snippet_d.pl b/utilities/gen_snippet_d.pl
> index 8ba31b5..e07e58d 100755
> --- a/utilities/gen_snippet_d.pl
> +++ b/utilities/gen_snippet_d.pl
> @@ -17,11 +17,19 @@ my @fcvsources_ltms;
>  my $snippet_key;
>  my $snippet_key_ltms;
>  my $source;
> +my @ignore_re;
> +my $re;
>  
>  $snippet_key = '\begin{snippet}' ;
>  $snippet_key_ltms = '\begin[snippet]' ;
> +@ignore_re = ('\.swp$', '~$', '\#$') ;  # to ignore backup of vim and emacs
>  @fcvsources = `grep -l -r -F '$snippet_key' CodeSamples` ;
> +@fcvsources = grep { not /\.ltms$/ } @fcvsources ;
>  @fcvsources_ltms = `grep -l -r -F '$snippet_key_ltms' CodeSamples` ;
> +foreach $re (@ignore_re) {
> +    @fcvsources = grep { not /$re/ } @fcvsources ;
> +    @fcvsources_ltms = grep { not /$re/ } @fcvsources_ltms ;
> +}
>  chomp @fcvsources ;
>  chomp @fcvsources_ltms ;
>  
> @@ -32,9 +40,6 @@ foreach $source (@fcvsources) {
>      my @snippet_commands1 ;
>      my $subdir ;
>      my $snippet ;
> -    if ($source =~ /\.ltms$/) {
> -	next;
> -    }
>      @snippet_commands1 = `grep -F '$snippet_key' $source` ;
>      chomp @snippet_commands1 ;
>      $source =~ m!(.*/[^/]+)/[^/]+! ;
> @@ -51,6 +56,7 @@ foreach $source (@fcvsources_ltms) {
>      my @snippet_commands1 ;
>      my $subdir ;
>      my $snippet ;
> +
>      @snippet_commands1 = `grep -F '$snippet_key_ltms' $source` ;
>      chomp @snippet_commands1 ;
>      $source =~ m!(.*/[^/]+)/[^/]+! ;
> @@ -77,9 +83,7 @@ foreach $source (@fcvsources) {
>      my $src_under_sub ;
>      my $subdir ;
>      my $snippet ;
> -    if ($source =~ /\.ltms$/) {
> -	next;
> -    }
> +
>      @snippet_commands2 = `grep -F '$snippet_key' $source` ;
>      chomp @snippet_commands2 ;
>      $src_under_sub = $source ;
> -- 
> 2.7.4
> 
> 

