Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794974158;
	b=LV7XBAyvkYcO3Eix0sXPLtbh4k5aPAstPlBJGkXuYE3DhefMUPic6l0d3Xpx0uy+rMOy
	 /3bhSfgD880/H8bdo4oIFNcrI6sYwDk6u1mPdyuEZgzJucZ5WDxdJDHDXDIPz2ts4HqRs
	 cloZbtYi68wLTPdvqnSlExd7A14d+iOAMUhUTb4s5De7fiNebAamJhEDC9YU+0Q7TiW69
	 phEV7EZ5eTXK8CGLQqXu7YEu2Gtau7wD0x1QNej7COmdasEHMVkbAh2/cgeb5e3+0350n
	 XKs5wlWOp+4FK1qZr8DBLXwwt/uXkHozbv6suxZ47qbZjn/jAQUte0LE+bywwMYs6dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794974158;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=05I+f4xdwEYVeYRjKDWIuY7JHgUkQmydfDgXhfBmmGo=;
	b=u8inKbNpnJazja0tFTFUiwBQyR/gCe2Av5S16nn03mQN9858+Rur2ET09rIljX4J8HO9
	 oWTBA2ciKXdGMAZQHvrJZ0T5xQDBGlssjj6+RZGY+moKrTTh/syLMBeFB9I+L1EWKbDbI
	 EnlG1YVKI/l2aCpNz/nCJo9C2CTiB0VOaEo5j1CMU+JKKtzneKBdM1RTjCuHgWu7TbSsy
	 m/0iyWg650jGfQ5rxohpExkGGgJfKG+c5h/3QsnDprRX7lZP6F00Wm4Cf+Bv85Qq0oQja
	 VpM4EMjaCBlYXpUWzMPdRkWxv+d5S85pMjgZ2DPnPoOlkzCWYL1IzDvm72oqtaPkbcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=fejes.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DB1606A31C
	for <perfbook@vger.kernel.org>; Wed, 18 Nov 2026 03:55:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9DB1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fejes.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-380b40319bdso963172eec.1
        for <perfbook@vger.kernel.org>; Tue, 17 Nov 2026 19:55:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794974157; x=1795578957;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=05I+f4xdwEYVeYRjKDWIuY7JHgUkQmydfDgXhfBmmGo=;
        b=w5sTDn4MjTHdOv60KZyUlu+DMrIPZILtIHmpSwHSsj0xHMXrFvp1oPmT52JXsWs0X7
         Yxi/OIVYkBEgc9x1ghRmyYzigq3wGOPUGdzNAd1SPGcAQQmB0AKYkPo5T39OSKCDUi7V
         2KO6JVxeCG2iGnjei3swRUvt1ktHEtSxCd+UVTcU1HLEgn1c07wxCIy9bLaboqU/CwTy
         rBovYiqBoxd1j+gGptcx+pYwQOzJT813duohPx7HEpc0o5nHGsnnWROcimIS3tcSoKGO
         /u1PqwDiX0/2jjxt27L6dD0QXyoCnutrRbRh5HKzd1dgH5aGvbBkQSJm8+CrpmD4OlBa
         l2Xg==
X-Forwarded-Encrypted: i=1; AL+hErFUNiwrmIa1PG7rmnwWhcM6iqXsYLo8nHExdV6qWM+mBPLerjnPg/H5WrdDBa8NCPDF9VKqGSd2lQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z95NZ0CcdkzQ866qBwCAyCPO9Z2+yk/Te0TNCLF3JrtcTWU2F6G
	lz4uysYWJdYOl2MpBCjwKnzHQjYV90B0Pg6CnWS4gjwXkFbE0CJ5n9c5
X-Gm-Gg: AZFdTZcPTpHiU7qHUxrB34w0xZT82+eqPUt/rfZQXRVDzGU+UNnoc62J47+zjVahvg7
	sdbbBB+USl2R2Y3Auearduj+qRQLWj4VqzKAgwZo0Soisk3HTU5m1jJJcBeGzGKuvG+18czmW0F
	CtfxmJ84lqNLjdQgw80J36adi7GWJXflGzIJCCU1U8zmyYLDcen8Ut6+k36fMKoZFCVq65PESTI
	yC4QzolM8K8he+cwdOEAah8s+4xuPOKfCtBKX+J+VznfmQ/zh7jH7Iy0aiD6pGp26Gl6gTf6aCw
	N9f9kmKt2EbjHh3ce6T90FfLFrT4TamnWrsNc+2N0agYoVIs5jAky1nk27oX9ysl2ron/LAUuil
	urdzU1uw8QpVG7iF6Q0+6ywjjbaNk78GFibX8hjzjFfyMvRSTXmDbir+yS+Kfw6jthfNZHCY8Wx
	ltEzRkbzupTzgxHSdFg6wjpfW4yuxhzk0NMEVx3Nh5C50Vy8xQnseHBsokhx3pXqSjeMHYMuZYe
	ikcTLv9edFVgWGe3SpqzPJSrMsS0bo0rF7lB4bKsXjqL6P4U/2KO6dm9LgpJf0vJX+FPpGDwXkU
	IDLizJjQrAG6Bbxo7V28JyR7PVhh33jnTAA+165aoC1/CThV+qfEX5Ud3tgHq1iZ1YUSf6DIKrV
	b4LFvRzuk2+FqzWhPaGOyn5OcLsacdcRYnuEcpPDc+7yEpeLanoFjXIdHNgP+CK4sFPVKPGWcVu
	guDC0d3Xkp48MnmyoqBWtv1QQdw+yoGz2f
X-Received: by 2002:a05:7301:2303:b0:376:19bd:2af9 with SMTP id 5a478bee46e88-3827d52b89cmr1351240eec.5.1794974156624;
        Tue, 17 Nov 2026 19:55:56 -0800 (PST)
Received: from [100.100.99.49] ([31.133.191.255])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a45274aesm3002740eec.2.2026.11.17.19.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 19:55:55 -0800 (PST)
Message-ID: <ceea81feffcb33c0749230e9b0bd8ed555027514.camel@fejes.dev>
Subject: Re: [RFC PATCH 0/7] Add reflowable HTML and EPUB3 build target
From: Ferenc Fejes <ferenc@fejes.dev>
To: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org
Cc: "Paul E . McKenney" <paulmck@kernel.org>, Leonardo Bras
	 <leobras.c@gmail.com>
Date: Wed, 18 Nov 2026 04:55:54 +0100
In-Reply-To: <6a18ce59-d2b2-4397-8d8a-f55b11d7b309@gmail.com>
References: <20261115210138.229034-1-ferenc@fejes.dev>
	 <11691935-1665-4d70-a606-56782d0819b2@gmail.com>
	 <73c4092d6771e0c8786576f1e577d20ddf207df9.camel@fejes.dev>
	 <1029ce85-ed7b-410f-9512-c0f8189cf066@gmail.com>
	 <6a18ce59-d2b2-4397-8d8a-f55b11d7b309@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10+b1 
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Post: <mailto:perfbook@vger.kernel.org>
List-Help: <mailto:perfbook+help@vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
List-Owner: <mailto:perfbook+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi,

On Tue, 2026-11-17 at 18:44 +0900, Akira Yokosawa wrote:
> On 11/17/26 11:41, Akira Yokosawa wrote:
> > Hi,
> >=20
> > On 11/17/26 02:21, Ferenc Fejes wrote:
> > > On Mon, 2026-11-16 at 13:41 +0900, Akira Yokosawa wrote:
> > [...]
> >=20
> > > > That said, I couldn't complete "make epub" with
> > > > debian/testing's TeX
> > > > Live.
> > >=20
> > > Sorry for that, I'm using Debian unstable which is a little bit
> > > ahead
> > > of tasting. I compiled it on Ubuntu 26.04 as well, but AFAIR
> > > there I
> > > have to install lwrap from source.
> >=20
> > Tested "make html" under debian/unstable.=C2=A0 It aborts with:
> >=20
> > ------------
> > [...]
> > LATEX=3Dpdflatex sh utilities/runlwarp.sh perfbook-epub html
> > pdflatex -draftmode for perfbook-epub # lwarp wrapper generation
> > pdflatex -draftmode for perfbook-epub_html # HTML pass 1
> > ----- glossary generation failed for perfbook-epub_html -----
> > make: *** [Makefile:701: perfbook-epub_html.html] Error 2
> > ------------
> >=20
> > So, build_glossary in runlwarp.sh returned error.
> >=20
> > Can't you reproduce it?

Unfortunately I cannot reproduce it. It builds cleanly both on my
machine and with a small docker build I put together. Its a bit
complicated because I dont wanted to install and configure docker on my
machine, nor put an alternative texlive on to my disk. But feel free to
use only the docker file and build the image with docker, if you have
it installed already.

Here I use podman, the script grab a pre-built binary from github,
build the dockerfile to a debian:unstable container then build the epub
target. It works within the /tmp folder,  I put here the content of
both file s/verbatim:

Dockerfile.debian-unstable

FROM docker.io/library/debian:unstable

ENV DEBIAN_FRONTEND=3Dnoninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates locales tzdata && \
    localedef -i en_US -c -f UTF-8 en_US.UTF-8 && \
    rm -rf /var/lib/apt/lists/*
ENV LANG=3Den_US.utf8

RUN apt-get update && apt-get install -y --no-install-recommends \
    fig2ps inkscape xfig graphviz psutils \
    texlive-publishers texlive-pstricks texlive-science texlive-fonts-
extra \
    texlive-latex-extra texlive-lang-japanese tex-gyre xindy \
    make git gnuplot-nox time poppler-utils librsvg2-bin pandoc unzip
zip \
    fontconfig fonts-freefont-ttf fonts-dejavu-core fonts-liberation &&
\
    rm -rf /var/lib/apt/lists/*

COPY steel-city-comic.regular.ttf /usr/local/share/fonts/
RUN fc-cache /usr/local/share/fonts/

WORKDIR /work
CMD ["/bin/bash"]



And the build script (which also have a clean argument to delete the
whole image, containers etc.). Again, this is optional, makes things
easier if you dont have docker installed and do not want to install for
this experiment.

#!/usr/bin/env bash
# SPDX-License-Identifier: GPL-2.0-or-later
#
# Build perfbook EPUB inside a disposable rootless Debian unstable
Podman
# container, keeping podman-static, container storage, and the build
tree
# under /tmp (tmpfs) to avoid writing to SSD.
#
# Usage: ./docker/build-epub-podman.sh [branch] [make-target]
#        ./docker/build-epub-podman.sh clean
#   Defaults: branch=3Depub-rfc, make-target=3Depub

set -euo pipefail

SCRIPT_DIR=3D"$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT=3D"$(cd "$SCRIPT_DIR/.." && pwd)"

BRANCH=3D"${1:-epub-rfc}"
TARGET=3D"${2:-epub}"

PODMAN_BASE=3D"/tmp/podman-static/podman-linux-amd64"
PODMAN_BIN=3D"$PODMAN_BASE/usr/local/bin/podman"
BUILD_DIR=3D"/tmp/perfbook-build"
IMAGE_NAME=3D"perfbook-debian-unstable"

export
PATH=3D"$PODMAN_BASE/usr/local/bin:$PODMAN_BASE/usr/local/lib/podman:$PAT
H"
export XDG_CONFIG_HOME=3D"/tmp/podman-cfg"
export XDG_DATA_HOME=3D"/tmp/podman-data"
export XDG_RUNTIME_DIR=3D"/tmp/podman-run"
export TMPDIR=3D"/tmp/podman-tmp"
export CONTAINERS_CONF=3D"$XDG_CONFIG_HOME/containers/containers.conf"
export CONTAINERS_POLICY=3D"$XDG_CONFIG_HOME/containers/policy.json"
export
CONTAINERS_REGISTRIES_CONF=3D"$XDG_CONFIG_HOME/containers/registries.conf
"

if [ "$BRANCH" =3D "clean" ]; then
    echo "=3D=3D> Cleaning up /tmp podman and build artifacts..."
    if [ -x "$PODMAN_BIN" ]; then
        "$PODMAN_BIN" --root=3D/tmp/podman-root --
runroot=3D"$XDG_RUNTIME_DIR" \
            unshare rm -rf /tmp/podman-root "$XDG_RUNTIME_DIR"
"$XDG_DATA_HOME" 2>/dev/null || true
    fi
    rm -rf /tmp/podman-static /tmp/podman-root "$XDG_RUNTIME_DIR" \
        "$XDG_CONFIG_HOME" "$XDG_DATA_HOME" "$TMPDIR" "$BUILD_DIR"
    echo "=3D=3D> Clean complete."
    exit 0
fi

if [ ! -x "$PODMAN_BIN" ]; then
    echo "=3D=3D> Downloading and configuring podman-static in /tmp..."
    mkdir -p /tmp/podman-static /tmp/podman-root "$XDG_RUNTIME_DIR" \
        "$XDG_CONFIG_HOME/containers" "$XDG_DATA_HOME" "$TMPDIR"

    curl -fsSL
"https://github.com/mgoltzsche/podman-static/releases/latest/download/podma=
n-linux-amd64.tar.gz
" \
        | tar -xz -C /tmp/podman-static
else
    mkdir -p /tmp/podman-root "$XDG_RUNTIME_DIR" \
        "$XDG_CONFIG_HOME/containers" "$XDG_DATA_HOME" "$TMPDIR"
fi

cp -r "$PODMAN_BASE/etc/containers/"* "$XDG_CONFIG_HOME/containers/"
cat <<EOF >> "$CONTAINERS_CONF"
helper_binaries_dir =3D ["$PODMAN_BASE/usr/local/lib/podman",
"$PODMAN_BASE/usr/local/bin"]
EOF

PODMAN=3D("$PODMAN_BIN" --root=3D/tmp/podman-root --
runroot=3D"$XDG_RUNTIME_DIR")

echo "=3D=3D> Cloning repository ($BRANCH -> $BUILD_DIR)..."
rm -rf "$BUILD_DIR"
git clone --no-hardlinks --branch "$BRANCH" "$REPO_ROOT" "$BUILD_DIR"

echo "=3D=3D> Building Debian unstable container image ($IMAGE_NAME)..."
"${PODMAN[@]}" build \
    -t "$IMAGE_NAME" \
    -f "$SCRIPT_DIR/Dockerfile.debian-unstable" \
    "$SCRIPT_DIR"

echo "=3D=3D> Running make -j$(nproc) $TARGET in container..."
"${PODMAN[@]}" run --rm \
    -v "$BUILD_DIR:/work" \
    -w /work \
    "$IMAGE_NAME" \
    make -j"$(nproc)" "$TARGET"

echo "=3D=3D> Done: $BUILD_DIR/perfbook.epub"


> >=20
> > >=20
> > > >=20
> > > > In perfbook-epub_html.log, there are a couple of warnings from
> > > > lwarp
> > > > as follows:
> > > >=20
> > > > -----
> > > > (/usr/share/texlive/texmf-dist/tex/latex/fancyvrb/fancyvrb.sty
> > > > Package: fancyvrb 2026/08/13 4.7 verbatim text (tvz,hv)
> > > > \FV@CodeLineNo=3D\count416
> > > > \FV@InFile=3D\read5
> > > > \FV@TabBox=3D\box69
> > > > \c@FancyVerbLine=3D\count417
> > > > \FV@StepNumber=3D\count418
> > > > \FV@OutFile=3D\write7
> > > > )
> > > >=20
> > > > Package lwarp Warning: A definition has changed:
> > > > (lwarp)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fancyvrb: \FV@ListProcessLine
> > > > (lwarp)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (9A9947A55E3D6D1C92E99F16EDC0BC68)
> > > > (lwarp)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 on input line 118.
> > > > -----
> >=20
> > I might have been confused by this warning.=C2=A0 This "Warning" is
> > actually an "Info"-level message from lwarp, isn't it?
> >=20
> > > >=20
> > > > , and at the bottom of the log:
> > > >=20
> > > > --------------------------------
> > > > Package verifycommand Warning: Definitions have changed.
> > > > Patches for the following macros may need to be updated.
> > > > See the previous warnings for line numbers.
> > > >=20
> > > > Syntax:=C2=A0 Patching pkg -> Defining pkg: Macro (checksum)
> > > > -----
> > > > (verifycommand)=C2=A0 lwarp -> fancyvrb: \FV@ListProcessLine
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (9A9947A55E3D6D1C92E99F16EDC0BC6=
8)
> > > > -----
> > > > Look for updates to these packages.
> > > > --------------------------------
> >=20
> > I have no idea if this warning from verifycommand can be ignored
> > ...
> >=20
> > In the log under debian/stable, this warning looks like this:
>=20
> I meant=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 debian/unstable
>=20
> Akira

I still concerned about why not build cleanly on your env. Cant you
have some local modifications/patches in the latex packages provided by
debian?

Oh and here is my fork to make things easier:
https://github.com/SPYFF/perfbook/tree/epub-rfc

Best,
Ferenc
