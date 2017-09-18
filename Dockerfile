FROM timotto/ubuntu-compiler:16.04

ARG ptxdist=2016.12.0

RUN curl http://public.pengutronix.de/software/ptxdist/ptxdist-${ptxdist}.tar.bz2 | tar jx \
	&& cd ptxdist-${ptxdist} \
	&& ./autogen.sh \
	&& ./configure --prefix=/usr/local \
	&& make -j4 \
	&& make install \
	&& cd .. \
	&& rm -rf ptxdist-${ptxdist}

ADD ptxdist-root.patch /
RUN patch -Np1 < /ptxdist-root.patch
