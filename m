Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbiL0ATo (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 26 Dec 2022 19:19:44 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD5C125F6
        for <perfbook@vger.kernel.org>; Mon, 26 Dec 2022 16:19:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5261460F37
        for <perfbook@vger.kernel.org>; Tue, 27 Dec 2022 00:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672100381;
        bh=JGbm/YrP1jWOAak7lt0pJGnyqKGIQrpbd0pqZjJCHog=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=dONl7WXvDzOz0tj9/RS5BIo4LXd1hThqsrospydW9eCofkZa7I3bicACQLd/Of0Ez
         wUpoLt4SUmpW7iohSnwVQjxm/IPUHuOvYbQfO6O1HLa/99FGHjCAJ5oYvV5Yx58k79
         F0K2pB3qt5bkmDJbKpNmQMh9nCfeJpU+Y1YlxMdh8khj94z51jX0HV37gN4HTY5URJ
         kBU7l4viAeZ6szBbG4+s2OsXtJn7iOR50AZvKoHKoD9il8WThJME3pfRlo+xGkC8fa
         afUklKdrqg5WeTmWzWi5Sg5NEMl0FfOz8Y7aFRJlDfI3LL9iaxxjAjzKbIxCNrbixQ
         IZqdftiMsvwPg==
Date: Mon, 26 Dec 2022 16:19:41 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] docker: bionic: Rollback glossaries-extra
 manually
Message-ID: <20221227001941.GE4001@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <2a6b2524-b76e-7de6-2c02-89f35bba9938@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a6b2524-b76e-7de6-2c02-89f35bba9938@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Dec 25, 2022 at 09:46:39AM +0900, Akira Yokosawa wrote:
> Since October 2022, glossaries-extra uses a modern LaTeX feature
> for backward compatibility, which was added in TeX Live 2018.
> Unfortunately, TeX Live of Bionic is based on TeX Live 2017, hence
> the glossaries-extra package at CTAN does not work out of the box.
> 
> Add commands for manual rollback in Dockerfile.bionic.
> 
> Update FAQ-BUILD.txt as well.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you!

							Thanx, Paul

> ---
> Hi,
> 
> I think it is quite unlikely a new reader/contributor of
> perfbook uses Ubuntu Bionic, but anyway.
> When Bionic is EOL'ed next spring, we can forget about it. ;-)
> 
>         Thanks, Akira
> --
>  FAQ-BUILD.txt            |  8 ++++++++
>  docker/Dockerfile.bionic | 15 +++++++++++++++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
> index eea4fa37737b..107707533398 100644
> --- a/FAQ-BUILD.txt
> +++ b/FAQ-BUILD.txt
> @@ -196,6 +196,14 @@
>  	    2.	Install it by following instructions at:
>  		https://help.ubuntu.com/community/LaTeX#Installing_packages_manually
>  
> +	    3.  Since October 2022, glossaries-extra uses a modern LaTeX
> +		feature for backward compatibility, which was added in
> +		TeX Live 2018. Unfortunately, TeX Live of Bionic is based
> +		on TeX Live 2017, hence the glossaries-extra package at
> +		CTAN does not work out of the box.
> +		Still, you can manually rollback it to an older version.
> +		See docker/Dockerfile.bionic for how to do it.
> +
>  	B.	Instead of above manual steps, you could install the package
>  		using a script in this repository,
>  		'./utilities/install_latex_package.sh'.  For example:
> diff --git a/docker/Dockerfile.bionic b/docker/Dockerfile.bionic
> index 207feca7d768..e1c4c3a9696b 100644
> --- a/docker/Dockerfile.bionic
> +++ b/docker/Dockerfile.bionic
> @@ -28,6 +28,21 @@ RUN curl https://mirrors.ctan.org/macros/latex/contrib/cleveref.zip -L -O && unz
>      texhash /usr/local/share/texmf && \
>      curl https://mirrors.ctan.org/graphics/a2ping.zip -L -O && unzip a2ping.zip && \
>      cp a2ping/a2ping.pl /usr/local/bin/a2ping
> +# Rollback glossaries-extra for pre-2018 TeX Live
> +RUN cd /usr/local/share/texmf/tex/latex/glossaries-extra/ \
> + && mv glossaries-extra.sty glossaries-extra-latest.sty \
> + && mv glossaries-extra-bib2gls.sty glossaries-extra-bib2gls-latest.sty \
> + && mv glossaries-extra-stylemods.sty glossaries-extra-stylemods-latest.sty \
> + && mv glossary-bookindex.sty glossary-bookindex-latest.sty \
> + && mv glossary-longextra.sty glossary-longextra-latest.sty \
> + && mv glossary-topic.sty glossary-topic-latest.sty \
> + && ln -s glossaries-extra-2021-11-22.sty glossaries-extra.sty \
> + && ln -s glossaries-extra-bib2gls-2021-11-22.sty glossaries-extra-bib2gls.sty \
> + && ln -s glossaries-extra-stylemods-2021-11-22.sty glossaries-extra-stylemods.sty \
> + && ln -s glossary-bookindex-2021-11-22.sty glossary-bookindex.sty \
> + && ln -s glossary-longextra-2021-11-22.sty glossary-longextra.sty \
> + && ln -s glossary-topic-2021-11-22.sty glossary-topic.sty \
> + && texhash /usr/local/share/texmf
>  ARG uid=1000
>  ARG gid=1000
>  ARG user=perfbook
> 
> base-commit: d5e69a022d636fb3e204c1ef90a3c668cbf0e8bc
> -- 
> 2.25.1
> 
